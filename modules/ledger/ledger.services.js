const { default: mongoose } = require("mongoose");
const ledgerModel = require("../../models/ledger");

exports.getAllService = async (req, res, next) => {
    const userId = res.locals.id;
    const ledgers = await ledgerModel
        .find(
            {
                $or: [
                    {
                        createdBy: {
                            $eq: new mongoose.Types.ObjectId(userId),
                        },
                        users: {
                            $in: [new mongoose.Types.ObjectId(userId)],
                        },
                    },
                ],
            },
            { _id: 1 }
        )
        .exec();
    return ledgers;
};

exports.getOneService = async (req, res, next) => {
    const userId = res.locals.id;
    const ledgerId = req.params.id;
    const ledger = await ledgerModel.findById(ledgerId).exec();
    if (!ledger) {
        return res.status(404).json(null);
    }
    const isAdmin = ledger.createdBy.toString() === userId;
    const member = ledger.users.filter((user) => user.id.toString() === userId);
    if (!isAdmin && member.length === 0) {
        return res.status(403).json(null);
    } else {
        return res
            .status(200)
            .json({ role: isAdmin ? "admin" : member.role, ledger });
    }
};
