defmodule Dsaur.AccountsTest do
  use Dsaur.DataCase
  import Dsaur.Factory
  alias Dsaur.Accounts

  describe "users" do
    test "list_users/0 returns all users" do
      insert_list(3, :user)
      users = Accounts.list_users()

      assert length(users) == 3
    end

    test "get_user!/1 returns the user with given id" do
      user = insert(:user)

      user.id
      |> Accounts.get_user!()
      |> (&assert(&1.email == user.email)).()
    end

    test "create_user/1 with valid data creates a user" do
      params = params_for(:user)
      {:ok, user} = Accounts.create_user(params)

      assert user
    end

    test "create_user/1 with invalid data returns error changeset" do
      params = params_for(:user, first_name: nil)
      {:error, error} = Accounts.create_user(params)

      assert error.errors[:first_name] == {"can't be blank", [validation: :required]}
    end

    test "update_user/2 with valid data updates the user" do
      user = insert(:user)
      {:ok, updated_user} = Accounts.update_user(user, %{first_name: "Jimothy"})

      assert updated_user.first_name == "Jimothy"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = insert(:user)
      {:error, error} = Accounts.update_user(user, %{first_name: nil})

      assert error.errors[:first_name] == {"can't be blank", [validation: :required]}
    end

    test "authenticate_by_username_password/2 will authenticate the user with their username and password" do
      %{credential: %{username: username, password: password}} = params = params_for(:user)
      Accounts.create_user(params)

      assert {:ok, _user} = Accounts.authenticate_by_username_password(username, password)
    end

    test "authenticate_by_username_password/2 will fail authenticate if the username is invalid" do
      params = params_for(:user)
      Accounts.create_user(params)

      assert {:error, _} = Accounts.authenticate_by_username_password("not_a_real_user", "nope")
    end

    test "authenticate_by_username_password/2 will fail authenticate if the password is invalid" do
      %{credential: %{username: username}} = insert(:user)

      assert {:error, _} = Accounts.authenticate_by_username_password(username, "nope")
    end
  end
end
