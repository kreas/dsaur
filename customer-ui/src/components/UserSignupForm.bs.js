'use strict';

var Curry = require("bs-platform/lib/js/curry.js");
var React = require("react");
var User$ReasonReactExamples = require("../models/User.bs.js");
var InputField$ReasonReactExamples = require("./forms/InputField.bs.js");

function UserSignupForm(Props) {
  var match = React.useState((function () {
          return /* record */[
                  /* firstName */"",
                  /* lastName */"",
                  /* email */"",
                  /* phoneNumber */""
                ];
        }));
  var setUser = match[1];
  var user = match[0];
  var updateUserState = function (field, value) {
    return Curry._1(setUser, (function (param) {
                  return User$ReasonReactExamples.update(user, field, value);
                }));
  };
  return React.createElement("form", undefined, React.createElement(InputField$ReasonReactExamples.make, {
                  value: user[/* firstName */0],
                  label: "First Name",
                  onChange: (function (param) {
                      return updateUserState("firstName", param);
                    })
                }), React.createElement(InputField$ReasonReactExamples.make, {
                  value: user[/* lastName */1],
                  label: "Last Name",
                  onChange: (function (param) {
                      return updateUserState("lastName", param);
                    })
                }), React.createElement(InputField$ReasonReactExamples.make, {
                  value: user[/* email */2],
                  label: "Email",
                  onChange: (function (param) {
                      return updateUserState("email", param);
                    }),
                  type_: "email"
                }), React.createElement(InputField$ReasonReactExamples.make, {
                  value: user[/* phoneNumber */3],
                  label: "Phone Number",
                  onChange: (function (param) {
                      return updateUserState("phoneNumber", param);
                    }),
                  type_: "tel"
                }));
}

var make = UserSignupForm;

exports.make = make;
/* react Not a pure module */
