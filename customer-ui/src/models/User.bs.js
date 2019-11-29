'use strict';


function update(user, field, value) {
  switch (field) {
    case "email" :
        return /* record */[
                /* firstName */user[/* firstName */0],
                /* lastName */user[/* lastName */1],
                /* email */value,
                /* phoneNumber */user[/* phoneNumber */3]
              ];
    case "firstName" :
        return /* record */[
                /* firstName */value,
                /* lastName */user[/* lastName */1],
                /* email */user[/* email */2],
                /* phoneNumber */user[/* phoneNumber */3]
              ];
    case "lastName" :
        return /* record */[
                /* firstName */user[/* firstName */0],
                /* lastName */value,
                /* email */user[/* email */2],
                /* phoneNumber */user[/* phoneNumber */3]
              ];
    case "phoneNumber" :
        return /* record */[
                /* firstName */user[/* firstName */0],
                /* lastName */user[/* lastName */1],
                /* email */user[/* email */2],
                /* phoneNumber */value
              ];
    default:
      return user;
  }
}

exports.update = update;
/* No side effect */
