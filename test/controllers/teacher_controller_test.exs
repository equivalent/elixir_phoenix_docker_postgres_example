defmodule Moderations.TeacherControllerTest do
  use Moderations.ConnCase

  alias Moderations.Teacher
  @valid_attrs %{email: "some content", name: "some content", moderations_id: 42}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, teacher_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing teachers"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, teacher_path(conn, :new)
    assert html_response(conn, 200) =~ "New teacher"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, teacher_path(conn, :create), teacher: @valid_attrs
    assert redirected_to(conn) == teacher_path(conn, :index)
    assert Repo.get_by(Teacher, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, teacher_path(conn, :create), teacher: @invalid_attrs
    assert html_response(conn, 200) =~ "New teacher"
  end

  test "shows chosen resource", %{conn: conn} do
    teacher = Repo.insert! %Teacher{}
    conn = get conn, teacher_path(conn, :show, teacher)
    assert html_response(conn, 200) =~ "Show teacher"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, teacher_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    teacher = Repo.insert! %Teacher{}
    conn = get conn, teacher_path(conn, :edit, teacher)
    assert html_response(conn, 200) =~ "Edit teacher"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    teacher = Repo.insert! %Teacher{}
    conn = put conn, teacher_path(conn, :update, teacher), teacher: @valid_attrs
    assert redirected_to(conn) == teacher_path(conn, :show, teacher)
    assert Repo.get_by(Teacher, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    teacher = Repo.insert! %Teacher{}
    conn = put conn, teacher_path(conn, :update, teacher), teacher: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit teacher"
  end

  test "deletes chosen resource", %{conn: conn} do
    teacher = Repo.insert! %Teacher{}
    conn = delete conn, teacher_path(conn, :delete, teacher)
    assert redirected_to(conn) == teacher_path(conn, :index)
    refute Repo.get(Teacher, teacher.id)
  end
end
