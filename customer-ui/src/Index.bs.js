'use strict';

var React = require("react");
var ReactDOMRe = require("reason-react/src/ReactDOMRe.js");
var UserSignupForm$ReasonReactExamples = require("./components/UserSignupForm.bs.js");

var app = React.createElement("div", undefined, React.createElement(UserSignupForm$ReasonReactExamples.make, { }));

ReactDOMRe.renderToElementWithId(app, "app");

exports.app = app;
/* app Not a pure module */
