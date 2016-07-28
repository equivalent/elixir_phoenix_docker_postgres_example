defmodule Moderations.TeacherTest do
  use Moderations.ModelCase

  alias Moderations.Teacher

  @valid_attrs %{email: "some content", name: "some content", moderations_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Teacher.changeset(%Teacher{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Teacher.changeset(%Teacher{}, @invalid_attrs)
    refute changeset.valid?
  end
end
