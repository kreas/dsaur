type t = {
  firstName: string,
  lastName: string,
  email: string,
  phoneNumber: string,
}

let update(user, field, value) = {
  switch (field) {
    | "firstName" => {...user, firstName: value}
    | "lastName" => {...user, lastName: value}
    | "email" => {...user, email: value}
    | "phoneNumber" => {...user, phoneNumber: value}
    | _ => user
  }
}
