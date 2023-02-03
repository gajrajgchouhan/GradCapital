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
const {extractGST} = require("./gst");
require("dotenv").config();


// Configure file storage mechanism from multer


async function main() {
    // await db.connectDB(process.env.DB);
    const app = express();

    app.use(express.static("public"));
    app.use(express.static("uploaded_receipts"));
    app.use(express.urlencoded({ extended: true }));
    app.set('view engine', 'ejs')
    const port = process.env.PORT || 3000;

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
    const upload = multer({ storage: storage });

    // parse application/x-www-form-urlencoded
    app.use(bodyParser.urlencoded({ extended: false }));

    // parse application/json
    app.use(bodyParser.json());

    app.get("/", (req, res) => {
        res.render("upload_receipt");
    });

    // https://appyflow.in/api/verifyGST?gstNo=33AAJCC8517E1ZS&key_secret=SECRET_KEY  
    
    app.post("/receipt", upload.single('formFile'), async (req, res) => {
        const gstNumber = await extractGST("fileName");
        if (gstNumber === null) res.send("Invalid GST number");
        else res.send("The GSTIN Registration No is " + String(gstNumber));
    })

    authRoutes(app);

    app.listen(port, () => {
        console.log(`Example app listening on port ${port}`);
    });
}

main();
