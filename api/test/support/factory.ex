defmodule Dsaur.Factory do
  use ExMachina.Ecto, repo: Dsaur.Repo
  alias Dsaur.Accounts.{User, Credential}

  def user_factory do
    %User{
      first_name: "John",
      last_name: "Doe",
      phone_number: "+15555555555",
      email: sequence(:email, &"email-#{&1}@example.com"),
      credential: build(:credential)
    }
  end

  def credential_factory do
    %Credential{
      username: sequence(:username, &"user-#{&1}"),
      password_hash: "$2b$12$ioFZtCHChjY8D/cJjBiygerPOo3tW2oUrK5Rv/oP9HmI8CVkuwTD2",
      password_confirmation: "Passw0rd1!",
      password: "Passw0rd1!"
    }
  end
end
