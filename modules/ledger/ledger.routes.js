const express = require("express");
const { jwtMiddleware } = require("../project/project.utils");
const prefix = "/ledger";
const controller = require("./ledger.controller");

/**
 *
 * @param {express.Application} app
 */
module.exports = (app) => {
    app.post(`${prefix}/getAll`, jwtMiddleware, controller.getAll);
    app.post(`${prefix}/getOne`, jwtMiddleware, controller.getOne);
};
