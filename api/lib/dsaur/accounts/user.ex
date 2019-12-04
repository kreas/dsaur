defmodule Dsaur.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Dsaur.Accounts.Credential

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :phone_number, :string

    timestamps()

    has_one :credential, Credential
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :email, :phone_number])
    |> validate_required([:first_name, :last_name, :email, :phone_number])
    |> unique_constraint(:email)
  end
end
