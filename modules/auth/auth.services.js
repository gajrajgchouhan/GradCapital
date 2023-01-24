const userModel = require("../../models/user");
const jwt = require("jsonwebtoken");

require("dotenv").config();

exports.loginService = async (req, res, next) => {
    const { username } = req.body;
    const isUser = await userModel.findOne({ username });

    if (!isUser) {
        return res.status(404).json({
            success: false,
            message: "User not found",
        });
    }

    console.log("user found");

    const payload = {
        id: isUser._id,
    };

    jwt.sign(
        payload,
        process.env.JWT_SECRET,
        { expiresIn: "1h" },
        (err, token) => {
            if (err) {
                return res.status(500).json({
                    success: false,
                    message: "Error while generating token",
                });
            } else {
                return res.status(200).json({
                    success: true,
                    token,
                });
            }
        }
    );
};

exports.registerService = async (req, res, next) => {
    const { name, username } = req.body;

    const isUser = await userModel.findOne({ $or: [{ username }] });

    if (isUser) {
        return res.status(400).json({
            success: false,
            message: "User already exists",
        });
    }

    const newUser = new userModel({
        name,
        username,
    });

    await newUser.save();

    return res.status(200).json({
        success: true,
    });
};
