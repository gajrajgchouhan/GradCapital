const userModel = require("../../models/user");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

// TODO

require("dotenv").config();

exports.loginService = async (req, res, next) => {
    const { email, password } = req.body;
    const isUser = await userModel.findOne({ email });

    if (!isUser) {
        return res.status(404).json({
            success: false,
            message: "User not found",
        });
    }

    console.log("user found");

    const isMatch = await bcrypt.compare(password, isUser.password);

    if (!isMatch) {
        return res.status(400).json({
            success: false,
            message: "Invalid credentials",
        });
    }

    // TODO TODO

    console.log("password is valid");

    const payload = {
        user: isUser.id,
    };

    jwt.sign(
        payload,
        process.env.JWT_SECRET,
        {
            expiresIn: 360000,
        },
        (err, token) => {
            if (err) throw err;
            res.status(200).json({
                user: token,
                chatToken,
            });
        }
    );
};

exports.registerService = async (req, res, next) => {
    const { name, username, email, password } = req.body;

    const isUser = await userModel.findOne({ $or: [{ username }, { email }] });

    if (isUser) {
        return res.status(400).json({
            success: false,
            message: "User already exists",
        });
    }

    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(password, salt);

    const newUser = new userModel({
        name,
        username,
        email,
        password: hashedPassword,
    });

    await newUser.save();

    return res.status(200).json({
        success: true,
    });
};

exports.getProfileService = async (req, res, next) => {
    const { user } = res.locals;

    const isUser = await userModel.findById(user.id).select("-password");

    if (!isUser) {
        return res.status(404).json({
            success: false,
            message: "User not found",
        });
    }

    return res.status(200).json({
        id: isUser.username,
        name: isUser.name,
        email: isUser.email,
        username: isUser.username,
    });
};
