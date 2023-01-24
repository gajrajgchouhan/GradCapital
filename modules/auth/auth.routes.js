const express = require("express");
const prefix = "/auth";
const controller = require("./auth.controller");

/**
 *
 * @param {express.Application} app
 */
module.exports = (app) => {
    app.post(`${prefix}/login`, controller.login);
    app.post(`${prefix}/register`, controller.register);
};
