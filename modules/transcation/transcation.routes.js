const express = require("express");
const { jwtMiddleware } = require("../project/project.utils");
const prefix = "/transcation";
const controller = require("./transcation.controller");

/**
 *
 * @param {express.Application} app
 */
module.exports = (app) => {
    app.post(`${prefix}/create`, jwtMiddleware, controller.create);
    app.post(`${prefix}/approve`, jwtMiddleware, controller.approve);
    app.post(`${prefix}/comment`, jwtMiddleware, controller.comment);
    app.post(`${prefix}/flag`, jwtMiddleware, controller.flag);
};
