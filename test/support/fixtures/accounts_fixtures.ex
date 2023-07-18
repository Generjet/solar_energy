defmodule Solar.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Solar.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        name: "some name",
        role: "some role",
        email: "some email"
      })
      |> Solar.Accounts.create_user()

    user
  end
end
