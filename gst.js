const request = require("request-promise");
const fs = require("fs");
const file_name = process.argv[2];
require("dotenv");
// console.log(arguments);

async function main() {
    async function getGSTNum(text) {
        var pattern = /GSTIN: \w{15}/;
        var gstin = text.match(pattern);

        if (gstin !== null) {
            return gstin[0].slice(-15);
        }
        else {
            pattern = /GST Registration No: \w{15}/;
            gstin = text.match(pattern);
        }

        if (gstin !== null) {
            return gstin[0].slice(-15);
        }
        else {
            pattern = /GSTIN No: \w{15}/;
            gstin = text.match(pattern);
        }

        if (gstin !== null) {
            return gstin[0].slice(-15);
        }
        return null
    }

    async function extractGST(fileName) {
        var receiptOcrEndpoint = 'https://ocr.asprise.com/api/v1/receipt';
        // var imageFile = '../uploaded_receipts/undefined__1674672536202.jpeg'; // Modify this to use your own file if necessary
        // var imageFile = fs.createReadStream("uploaded_receipts/SomeFormOfUID__1675010376436.jpeg"); // Modify this to use your own file if necessary
        // console.log(fileName);
        var imageFile = fs.createReadStream(fileName); // Modify this to use your own file if necessary
        const response = await request.post({
            url: receiptOcrEndpoint,
            formData: {
                api_key: 'TEST',        // Use 'TEST' for testing purpose
                recognizer: 'auto',        // can be 'US', 'CA', 'JP', 'SG' or 'auto'
                ref_no: 'ocr_nodejs_123', // optional caller provided ref code
                file: imageFile // the image file
            },
        }, async function (error, response, body) {
            if (error) console.error(error);
            else return body;
        });

        const gstin_string = await JSON.parse(response);
        if (gstin_string.success == false) {
            console.log("Success is false");
            return null;
        }
        return gstin_string.receipts[0].merchant_tax_reg_no;
        // var text = gstin_string.receipts[0].ocr_text;
        // const gstNumber = await getGSTNum(text);
        // return gstNumber;
    }

    async function verifyGST(data = {}) {
        // Default options are marked with *
        const response = await fetch('https://appyflow.in/api/verifyGST', {
            method: 'POST', // *GET, POST, PUT, DELETE, etc.
            mode: 'cors', // no-cors, *cors, same-origin
            cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
            credentials: 'same-origin', // include, *same-origin, omit
            headers: {
                'Content-Type': 'application/json'
                // 'Content-Type': 'application/x-www-form-urlencoded',
            },
            redirect: 'follow', // manual, *follow, error
            referrerPolicy: 'no-referrer', // no-referrer, *no-referrer-when-downgrade, origin, origin-when-cross-origin, same-origin, strict-origin, strict-origin-when-cross-origin, unsafe-url
            body: JSON.stringify(data) // body data type must match "Content-Type" header
        });
        return response.json(); // parses JSON response into native JavaScript objects
    }
    // console.log(file_name);
    const gstNumber = await extractGST(file_name);
    if (gstNumber === null) {
        console.log("The receipt does not have a GST number"); return;
    }
    const isFake = await verifyGST({ gstNo: String(gstNumber), key_secret: "AgevsDeoiPdA9LgER4znaVwS1w62" });
    if (isFake === false) {
        console.log("The GSTIN Registration No given in the receipt as " + String(gstNumber) + " is fake!!"); return;
    }
    else console.log("The GSTIN Registration No is " + String(gstNumber) + " and is valid");
    return;
}

main();















// module.exports = { extractGST, getGSTNum, verifyGST };