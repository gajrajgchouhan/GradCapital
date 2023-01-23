const mongoose = require("mongoose");
const Schema = mongoose.Schema;

// comment schema
const commentSchema = new Schema({
    description: {
        type: String,
        required: true,
    },
    createdBy: {
        type: String,
        required: true,
        ref: "User",
    },
});

mongoose.model("Comment", commentSchema);
