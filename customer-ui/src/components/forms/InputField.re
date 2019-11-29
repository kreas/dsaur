[@react.component]
let make = (~value="", ~label, ~onChange as handleChange, ~type_="text") =>
  <div className="input-field">
    <label> {React.string(label)} </label>
    <input
      type_
      value
      className="u-full-width"
      onChange={e => handleChange(ReactEvent.Form.target(e)##value)}
    />
  </div>;
