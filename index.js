const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const db = require("./db");
const authRoutes = require("./modules/auth/auth.routes");
const ejs = require("ejs");
const formidable = require("formidable");
const fs = require("fs");
const { log } = require("console");
const multer = require("multer");
const request = require('request-promise');

require("dotenv").config();


// Configure file storage mechanism from multer


async function main() {
    // await db.connectDB(process.env.DB);
    const app = express();

    app.use(express.static("public"));
    app.use(express.static("uploaded_receipts"));
    app.use(express.urlencoded({ extended: true }));
    app.set('view engine', 'ejs')
    const port = process.env.PORT || 5000;

    app.use(cors());
    var storage = multer.diskStorage({
        destination: function (req, file, cb) {
            cb(null, 'uploaded_receipts/')
        },
        filename: async function (req, file, cb) {
            cb(null, 'SomeFormOfUID__' + String(Date.now()) +
                '.' + file.mimetype.split('/')[1]);
        }
    })
    var upload = multer({ storage: storage });

    // parse application/x-www-form-urlencoded
    app.use(bodyParser.urlencoded({ extended: false }));

    // parse application/json
    app.use(bodyParser.json());

    app.get("/", (req, res) => {
        res.render("upload_receipt");
    });

    // https://appyflow.in/api/verifyGST?gstNo=33AAJCC8517E1ZS&key_secret=SECRET_KEY  
    async function getGSTNum(text) {
        // console.log(text);
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
        console.log("GST num returning null");
        return null
    }
    async function extractGST(fileName) {
        var receiptOcrEndpoint = 'https://ocr.asprise.com/api/v1/receipt';
        var imageFile = 'uploaded_receipts/undefined__1674672536202.jpeg'; // Modify this to use your own file if necessary
        var response = await request.post({
            url: receiptOcrEndpoint,
            formData: {
                api_key: 'TEST',        // Use 'TEST' for testing purpose
                recognizer: 'auto',        // can be 'US', 'CA', 'JP', 'SG' or 'auto'
                ref_no: 'ocr_nodejs_123', // optional caller provided ref code
                file: fs.createReadStream(imageFile) // the image file
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

    app.post("/receipt", upload.single('formFile'), async (req, res) => {
        const gstNumber = await extractGST("fileName");
        // console.log(gstNumber);
        // console.log("post printing");
        if (gstNumber === null) res.send("Invalid GST number");
        else res.send("The GSTIN Registration No is " + String(gstNumber));
    })

    authRoutes(app);

    app.listen(port, () => {
        console.log(`Example app listening on port ${port}`);
    });
}

main();
