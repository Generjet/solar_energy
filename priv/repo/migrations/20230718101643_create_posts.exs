defmodule Solar.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :body, :text
      add :title, :string
      add :post_status, :integer

      timestamps()
    end
  end
end
