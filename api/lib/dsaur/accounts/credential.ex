defmodule Dsaur.Accounts.Credential do
  use Ecto.Schema
  import Ecto.Changeset
  alias Dsaur.Accounts.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "credentials" do
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :password_hash, :string
    field :username, :string

    timestamps()

    belongs_to :user, User
  end

  @doc false
  def changeset(credential, attrs) do
    credential
    |> cast(attrs, [:username, :password, :password_confirmation])
    |> validate_required([:username, :password, :password_confirmation])
    |> validate_length(:password, min: 8)
    |> unique_constraint(:username)
    |> validate_password_confirmation()
    |> validate_password_complexity()
    |> hash_password()
  end

  def verify_password(%{credential: %{password_hash: hash}} = user, password) do
    case Bcrypt.verify_pass(password, hash) do
      true -> {:ok, user}
      false -> {:error, :unauthorized}
    end
  end

  def verify_password(nil, _) do
    {:error, :unauthorized}
  end

  # PRIVATE #

  defp validate_password_confirmation(%Ecto.Changeset{changes: %{password: password}} = changeset) do
    case password == get_field(changeset, :password_confirmation) do
      true ->
        changeset

      false ->
        add_error(changeset, :password_confirmation, "doesn't match password")
    end
  end

  defp validate_password_complexity(%Ecto.Changeset{changes: %{password: password}} = changeset) do
    strength_check = ~r/(?=^.{8,}$)(?=.*\d)(?=.*[!@#$%^&*]+)(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/

    case String.match?(password, strength_check) do
      true ->
        changeset

      false ->
        add_error(changeset, :password, "not complex enough")
    end
  end

  defp hash_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, Bcrypt.hash_pwd_salt(password))

      _ ->
        changeset
    end
  end
end
