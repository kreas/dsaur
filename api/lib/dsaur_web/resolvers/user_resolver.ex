defmodule DsaurWeb.Resolvers.UserResolver do
  alias Dsaur.Accounts

  def users(_, _, _) do
    {:ok, Accounts.list_users()}
  end

  def create_user(_, %{input: input}, _) do
    Accounts.create_user(input)
  end
end
