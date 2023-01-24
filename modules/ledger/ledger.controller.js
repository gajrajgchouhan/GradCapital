const express = require("express");
const ledgerServices = require("./ledger.services");

/**
 *
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 * @returns
 */
exports.getAll = async (req, res, next) => {
    try {
        return await ledgerServices.getAllService(req, res, next);
    } catch (error) {
        console.log(error.stack);
        res.status(500).json({ message: error.message });
        next(error);
    }
};

/**
 *
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 * @returns
 */
exports.getOne = async (req, res, next) => {
    try {
        return await ledgerServices.getOneService(req, res, next);
    } catch (error) {
        console.log(error.stack);
        res.status(500).json({ message: error.message });
        next(error);
    }
};

/**
 *
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 * @returns
 */
exports.create = async (req, res, next) => {
    try {
        return await ledgerServices.createService(req, res, next);
    } catch (error) {
        console.log(error.stack);
        res.status(500).json({ message: error.message });
        next(error);
    }
};
