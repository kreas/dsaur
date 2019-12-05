defmodule DsaurWeb.Schema.Types.UserType do
  use Absinthe.Schema.Notation
  alias DsaurWeb.Resolvers.CredentialResolver

  object :user_type do
    field(:id, :id)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:email, :string)
    field(:phone_number, :string)

    field :credentials, :credential_type do
      resolve(&CredentialResolver.get_credential/3)
    end
  end

  input_object :user_input_type do
    field(:first_name, non_null(:string))
    field(:last_name, non_null(:string))
    field(:email, non_null(:string))
    field(:phone_number, non_null(:string))
    field(:credential, non_null(:credential_input_type))
  end
end
