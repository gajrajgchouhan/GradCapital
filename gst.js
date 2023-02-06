const request = require("request-promise");
const fs = require("fs");
require("dotenv");

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
    var imageFile = fs.createReadStream("uploaded_receipts/SomeFormOfUID__1675010376436.jpeg"); // Modify this to use your own file if necessary
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

async function verifyGST(gstNum){
    const appyflow_url = "https://appyflow.in/api/verifyGST";
    const response = await request.post({
        url: appyflow_url,
        formData: {
            gstNo : gstNum,        // Use 'TEST' for testing purpose
            key_secret : process.env.Appy_Flow_Secret_Key,
        },
    }, async function (error, response, body) {
        if (error) console.error(error);
        else return body;
    });

    const json_res = await JSON.parse(response);
    if(json_res.taxpayerInfo === undefined) return false;
    return true;
}


module.exports = {extractGST, getGSTNum, verifyGST};
