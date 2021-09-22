defmodule SurveyBackend.Notification do
  @moduledoc """
  The Notification context.
  """

  import Ecto.Query, warn: false
  alias SurveyBackend.Repo

  alias SurveyBackend.Notification.Notifications

  @doc """
  Returns the list of notification.

  ## Examples

      iex> list_notification()
      [%Notifications{}, ...]

  """
  def list_notification do
    Repo.all(Notifications)
  end

  @doc """
  Gets a single notifications.

  Raises `Ecto.NoResultsError` if the Notifications does not exist.

  ## Examples

      iex> get_notifications!(123)
      %Notifications{}

      iex> get_notifications!(456)
      ** (Ecto.NoResultsError)

  """
  def get_notifications!(id), do: Repo.get!(Notifications, id)

  @doc """
  Creates a notifications.

  ## Examples

      iex> create_notifications(%{field: value})
      {:ok, %Notifications{}}

      iex> create_notifications(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_notifications(attrs \\ %{}) do
    %Notifications{}
    |> Notifications.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a notifications.

  ## Examples

      iex> update_notifications(notifications, %{field: new_value})
      {:ok, %Notifications{}}

      iex> update_notifications(notifications, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_notifications(%Notifications{} = notifications, attrs) do
    notifications
    |> Notifications.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a notifications.

  ## Examples

      iex> delete_notifications(notifications)
      {:ok, %Notifications{}}

      iex> delete_notifications(notifications)
      {:error, %Ecto.Changeset{}}

  """
  def delete_notifications(%Notifications{} = notifications) do
    Repo.delete(notifications)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking notifications changes.

  ## Examples

      iex> change_notifications(notifications)
      %Ecto.Changeset{data: %Notifications{}}

  """
  def change_notifications(%Notifications{} = notifications, attrs \\ %{}) do
    Notifications.changeset(notifications, attrs)
  end
end
