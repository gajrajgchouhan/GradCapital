const jwt = require("jsonwebtoken");

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
        console.log({ decoded }); // TODO
        next();
    });
};
