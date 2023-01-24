const jwt = require("jsonwebtoken");
const userModel = require("../../models/user");
const ledgerModel = require("../../models/ledger");

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

const findRole = async (ledgerId, userId) => {
    const ledger = await ledgerModel.findById(ledgerId).exec();
    const isUserAdmin = ledger.createdBy.toString() == userId;
    if (isUserAdmin) {
        return "admin";
    } else {
        const userObj = ledger.users.find((user) => user.id == userId);
        if (userObj) {
            return userObj.role;
        } else {
            return null;
        }
    }
};

/**
 *
 * @param {"admin"|"spender"|"stakeholder"} role
 * @returns
 */
exports.checkRoleMiddleware = (role) => async (req, res, next) => {
    const { ledgerId } = req.params;
    const currRole = await findRole(ledgerId, res.locals.id);
    // possible role -> admin,spender,stakeholder
    if (currRole === null || currRole !== role) {
        res.status(403).json({ message: "Forbidden" });
        return;
    } else next();
};
