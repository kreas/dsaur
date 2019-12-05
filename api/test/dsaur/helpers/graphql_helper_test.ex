defmodule Dsaur.Helpers.GraphQLHelperTest do
  use Dsaur.DataCase
  import Dsaur.Factory
  import Dsaur.Helpers.GraphQLHelper
  alias Dsaur.Accounts

  describe "format_mutation_response/1" do
    test "it returns a record if no errors are found in a changset" do
      params = params_for(:user)
      user = Accounts.create_user(params)

      assert user == format_mutation_response(user)
    end

    test "it properly formats an error response" do
      creds = build(:credential, username: nil)
      params = params_for(:user, credential: creds)
      user = Accounts.create_user(params)

      assert {:error, %{message: %{credential: _}}} = format_mutation_response(user)
    end
  end
end
