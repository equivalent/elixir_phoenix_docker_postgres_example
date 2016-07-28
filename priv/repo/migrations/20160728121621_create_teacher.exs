defmodule Moderations.Repo.Migrations.CreateTeacher do
  use Ecto.Migration

  def change do
    create table(:teachers) do
      add :name, :string
      add :email, :string
      add :moderations_id, :integer

      timestamps()
    end

  end
end
