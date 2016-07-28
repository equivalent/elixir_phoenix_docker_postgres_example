defmodule Moderations.Teacher do
  use Moderations.Web, :model

  schema "teachers" do
    field :name, :string
    field :email, :string
    field :moderations_id, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email])
    |> validate_required([:name, :email])
  end
end
