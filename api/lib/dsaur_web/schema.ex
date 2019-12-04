defmodule DsaurWeb.Schema do
  use Absinthe.Schema

  alias DsaurWeb.Resolvers.{
    UserResolver
  }

  import_types(DsaurWeb.Schema.Types)

  query do
    @desc "Get a list of all users"
    field :users, list_of(:user_type) do
      resolve(&UserResolver.users/3)
    end
  end

  mutation do
    @desc "Create a new users"
    field :create_user, type: :user_type do
      arg(:input, non_null(:user_input_type))
      resolve(&UserResolver.create_user/3)
    end
  end
end
