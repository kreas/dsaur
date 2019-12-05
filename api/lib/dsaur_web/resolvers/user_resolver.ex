defmodule DsaurWeb.Resolvers.UserResolver do
  import Dsaur.Helpers.GraphQLHelper
  alias Dsaur.Accounts

  def users(_, _, _) do
    {:ok, Accounts.list_users()}
  end

  def create_user(_, %{input: input}, _) do
    input
    |> Accounts.create_user()
    |> format_mutation_response
  end
end
