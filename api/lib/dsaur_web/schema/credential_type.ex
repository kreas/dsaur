defmodule DsaurWeb.Schema.Types.CredentialType do
  use Absinthe.Schema.Notation

  object :credential_type do
    field(:username, :string)
    field(:inserted_at, :string)
  end

  input_object :credential_input_type do
    field(:username, non_null(:string))
    field(:password, non_null(:string))
    field(:password_confirmation, non_null(:string))
  end
end
