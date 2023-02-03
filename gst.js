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
    var imageFile = fs.createReadStream("uploaded_receipts/receipt_nogst.jpg"); // Modify this to use your own file if necessary
    var response = await request.post({
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
    var text = gstin_string.receipts[0].ocr_text;
    const gstNumber = await getGSTNum(text);
    return gstNumber;
}



module.exports = {extractGST, getGSTNum};
