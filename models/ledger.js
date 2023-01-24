const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const ledgerSchema = new Schema({
    transcations: [
        {
            type: Schema.Types.ObjectId,
            ref: "Transaction",
        },
    ],
    users: [
        {
            id: {
                type: Schema.Types.ObjectId,
                required: true,
                ref: "User",
            },
            role: {
                type: String,
                required: true,
                enum: ["admin", "spender", "stakeholder"],
            },
        },
    ],
    createdBy: {
        type: Schema.Types.ObjectId,
        required: true,
        ref: "User",
    },
});

module.exports = mongoose.model("Ledger", ledgerSchema);
