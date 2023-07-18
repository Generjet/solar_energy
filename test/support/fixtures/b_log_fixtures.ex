defmodule Solar.BLogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Solar.BLog` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        title: "some title",
        body: "some body",
        post_status: 42
      })
      |> Solar.BLog.create_post()

    post
  end
end
