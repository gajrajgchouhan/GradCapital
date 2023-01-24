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
    app.post(`${prefix}/create`, jwtMiddleware, controller.create);
    // TODO
    // filters, pdf generation
    // app.post(`${prefix}/category`, jwtMiddleware, controller.category);
    // app.post(`${prefix}/people`, jwtMiddleware, controller.people);
    // app.post(`${prefix}/pdf`, jwtMiddleware, controller.pdf);
};
