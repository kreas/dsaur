defmodule Dsaur.Helpers.GraphQLHelper do
  @doc """
  Formats the response of a resolver

    iex> format_mutation_response({:ok, %User{}})
    {:ok, %User{}}

    iex> format_mutation_response({:error, %Ecto.Changeset{}})
    {:error, %{message: %{field: "can't be blank"}}}
  """
  def format_mutation_response({:error, changeset}) do
    {:error, %{message: traverse_errors(changeset)}}
  end

  def format_mutation_response(record), do: record

  @doc """
  Extracts errors from a changeset. Even the nested ones

    iex> traverse_errors(changeset)
    %{errors: %{field: "can't be blank"}}
  """
  def traverse_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn
      {msg, opts} -> String.replace(msg, "%{count}", to_string(opts[:count]))
      msg -> msg
    end)
  end
end
