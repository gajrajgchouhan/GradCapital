const express = require("express");
const authServices = require("./auth.services");

/**
 *
 * @param {express.Request} req
 * @param {express.Response} res
 * @param {express.NextFunction} next
 * @returns
 */
exports.login = async (req, res, next) => {
    try {
        return await authServices.loginService(req, res, next);
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
exports.register = async (req, res, next) => {
    try {
        return await authServices.registerService(req, res, next);
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
exports.getProfile = async (req, res, next) => {
    try {
        return await authServices.getProfileService(req, res, next);
    } catch (error) {
        console.log(error.stack);
        res.status(500).json({ message: error.message });
        next(error);
    }
};
