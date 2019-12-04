defmodule Dsaur.Accounts.CredentialTest do
  use Dsaur.DataCase

  import Dsaur.Factory

  alias Dsaur.Accounts.Credential

  describe "changeset" do
    test "it errors if password_confirmation is different from the password" do
      params = params_for(:credential, password_confirmation: "test")
      %{errors: errors} = build_changeset(params)

      assert errors[:password_confirmation] == {"doesn't match password", []}
    end

    test "it errors if the password is not complex enough" do
      params = params_for(:credential, password: "aaaaaaaa", password_confirmation: "aaaaaaaa")
      %{errors: errors} = build_changeset(params)

      assert errors[:password] == {"not complex enough", []}
    end
  end

  defp build_changeset(params) do
    Credential.changeset(%Credential{}, params)
  end
end
