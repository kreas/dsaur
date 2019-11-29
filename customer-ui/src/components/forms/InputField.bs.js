'use strict';

var Curry = require("bs-platform/lib/js/curry.js");
var React = require("react");

function InputField(Props) {
  var match = Props.value;
  var value = match !== undefined ? match : "";
  var label = Props.label;
  var handleChange = Props.onChange;
  var match$1 = Props.type_;
  var type_ = match$1 !== undefined ? match$1 : "text";
  return React.createElement("div", {
              className: "input-field"
            }, React.createElement("label", undefined, label), React.createElement("input", {
                  className: "u-full-width",
                  type: type_,
                  value: value,
                  onChange: (function (e) {
                      return Curry._1(handleChange, e.target.value);
                    })
                }));
}

var make = InputField;

exports.make = make;
/* react Not a pure module */
