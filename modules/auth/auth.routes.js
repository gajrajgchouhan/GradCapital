const express = require("express");
const prefix = "/auth";
const controller = require("./auth.controller");
const { jwtMiddleware } = require("../project/project.utils");

/**
 *
 * @param {express.Application} app
 */
module.exports = (app) => {
    // example
    app.get(`${prefix}/getProfile`, jwtMiddleware, controller.getProfile);
    app.post(`${prefix}/login`, controller.login);
    app.post(`${prefix}/register`, controller.register);
};
