defmodule Moderations.TeacherController do
  use Moderations.Web, :controller

  alias Moderations.Teacher

  def index(conn, _params) do
    teachers = Repo.all(Teacher)
    render(conn, "index.html", teachers: teachers)
  end

  def new(conn, _params) do
    changeset = Teacher.changeset(%Teacher{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"teacher" => teacher_params}) do
    changeset = Teacher.changeset(%Teacher{}, teacher_params)

    case Repo.insert(changeset) do
      {:ok, _teacher} ->
        conn
        |> put_flash(:info, "Teacher created successfully.")
        |> redirect(to: teacher_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    teacher = Repo.get!(Teacher, id)
    render(conn, "show.html", teacher: teacher)
  end

  def edit(conn, %{"id" => id}) do
    teacher = Repo.get!(Teacher, id)
    changeset = Teacher.changeset(teacher)
    render(conn, "edit.html", teacher: teacher, changeset: changeset)
  end

  def update(conn, %{"id" => id, "teacher" => teacher_params}) do
    teacher = Repo.get!(Teacher, id)
    changeset = Teacher.changeset(teacher, teacher_params)

    case Repo.update(changeset) do
      {:ok, teacher} ->
        conn
        |> put_flash(:info, "Teacher updated successfully.")
        |> redirect(to: teacher_path(conn, :show, teacher))
      {:error, changeset} ->
        render(conn, "edit.html", teacher: teacher, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    teacher = Repo.get!(Teacher, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(teacher)

    conn
    |> put_flash(:info, "Teacher deleted successfully.")
    |> redirect(to: teacher_path(conn, :index))
  end
end
