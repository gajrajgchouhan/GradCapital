const mongoose = require("mongoose");
const Schema = mongoose.Schema;

// https://stackoverflow.com/questions/44869479/what-data-type-should-i-use-to-store-an-image-with-mongodb

const transactionSchema = new Schema({
    name: {
        type: String,
        required: true,
    },
    description: {
        type: String,
        required: true,
    },
    amount: {
        type: Number,
        required: true,
    },
    image: {
        type: Buffer,
        required: true,
    },
    approval: {
        type: Boolean,
        required: true,
    },
    flagged: {
        type: Boolean,
        required: true,
    },
    category: {
        type: String,
        required: true,
    },
    credit: {
        type: Boolean,
        required: true,
    },
    createdBy: {
        type: Schema.Types.ObjectId,
        required: true,
        ref: "User",
    },
    approvedBy: [
        {
            type: Schema.Types.ObjectId,
            ref: "User",
        },
    ],
    comments: [
        {
            type: Schema.Types.ObjectId,
            ref: "Comment",
        },
    ],
});

module.exports = mongoose.model("Transcation", transactionSchema);
