open User;

[@react.component]
let make = () => {
  let (user, setUser) =
    React.useState(() =>
      {firstName: "", lastName: "", email: "", phoneNumber: ""}
    );

  let updateUserState = (field, value) =>
    setUser(_ => update(user, field, value));

  <form>
    <InputField
      label="First Name"
      value={user.firstName}
      onChange={updateUserState("firstName")}
    />
    <InputField
      label="Last Name"
      value={user.lastName}
      onChange={updateUserState("lastName")}
    />
    <InputField
      label="Email"
      type_="email"
      value={user.email}
      onChange={updateUserState("email")}
    />
    <InputField
      label="Phone Number"
      type_="tel"
      value={user.phoneNumber}
      onChange={updateUserState("phoneNumber")}
    />
  </form>;
};
