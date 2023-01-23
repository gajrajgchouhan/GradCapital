const mongoose = require("mongoose");

const connectDB = (uri) =>
    new Promise((resolve, reject) => {
        mongoose.set("strictQuery", true);
        mongoose.connect(uri, {
            useNewUrlParser: true,
            useUnifiedTopology: true,
        });
        mongoose.connection.on("error", (error) => reject(error));
        mongoose.connection.once("open", () => {
            console.log("DB Connected");
            resolve();
        });
    });

module.exports = { connectDB };
