const jwt = require("jsonwebtoken");
const userModel = require("../../models/user");

exports.jwtMiddleware = (req, res, next) => {
    const token = req.headers.authorization;
    if (!token) {
        res.status(401).json({ message: "No token provided" });
        return;
    }
    jwt.verify(token, process.env.JWT_SECRET, (err, decoded) => {
        if (err) {
            res.status(401).json({ message: "Failed to authenticate token" });
            return;
        }
        userModel.findById(decoded.id).then((user) => {
            if (!user) {
                res.status(401).json({ message: "User not found" });
                return;
            } else {
                res.locals = { user, id: user._id };
                next();
            }
        });
    });
};
