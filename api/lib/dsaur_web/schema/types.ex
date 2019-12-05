defmodule DsaurWeb.Schema.Types do
  use Absinthe.Schema.Notation

  alias DsaurWeb.Schema.Types

  import_types(Types.UserType)
  import_types(Types.CredentialType)
end
