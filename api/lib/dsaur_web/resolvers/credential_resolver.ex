defmodule DsaurWeb.Resolvers.CredentialResolver do
  alias Dsaur.Accounts
  alias Dsaur.Accounts.User

  def get_credential(%User{} = user, _, _) do
    credential = Accounts.get_credential(user)

    case credential do
      nil -> {:ok, nil}
      _ -> {:ok, credential}
    end
  end

  def set_credential(user, %{input: input}, _) do
    IO.inspect(user, label: "user")
    IO.inspect(input, label: "input")
  end
end
