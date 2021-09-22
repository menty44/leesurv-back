defmodule SurveyBackend.Communication do
  @moduledoc """
  The Communication context.
  """

  import Ecto.Query, warn: false
  alias SurveyBackend.Repo

  alias SurveyBackend.Communication.Smss

  @doc """
  Returns the list of sms.

  ## Examples

      iex> list_sms()
      [%Smss{}, ...]

  """
  def list_sms do
    Repo.all(Smss)
  end

  @doc """
  Gets a single smss.

  Raises `Ecto.NoResultsError` if the Smss does not exist.

  ## Examples

      iex> get_smss!(123)
      %Smss{}

      iex> get_smss!(456)
      ** (Ecto.NoResultsError)

  """
  def get_smss!(id), do: Repo.get!(Smss, id)

  @doc """
  Creates a smss.

  ## Examples

      iex> create_smss(%{field: value})
      {:ok, %Smss{}}

      iex> create_smss(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_smss(attrs \\ %{}) do
    %Smss{}
    |> Smss.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a smss.

  ## Examples

      iex> update_smss(smss, %{field: new_value})
      {:ok, %Smss{}}

      iex> update_smss(smss, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_smss(%Smss{} = smss, attrs) do
    smss
    |> Smss.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a smss.

  ## Examples

      iex> delete_smss(smss)
      {:ok, %Smss{}}

      iex> delete_smss(smss)
      {:error, %Ecto.Changeset{}}

  """
  def delete_smss(%Smss{} = smss) do
    Repo.delete(smss)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking smss changes.

  ## Examples

      iex> change_smss(smss)
      %Ecto.Changeset{data: %Smss{}}

  """
  def change_smss(%Smss{} = smss, attrs \\ %{}) do
    Smss.changeset(smss, attrs)
  end

  alias SurveyBackend.Communication.Emails

  @doc """
  Returns the list of email.

  ## Examples

      iex> list_email()
      [%Emails{}, ...]

  """
  def list_email do
    Repo.all(Emails)
  end

  @doc """
  Gets a single emails.

  Raises `Ecto.NoResultsError` if the Emails does not exist.

  ## Examples

      iex> get_emails!(123)
      %Emails{}

      iex> get_emails!(456)
      ** (Ecto.NoResultsError)

  """
  def get_emails!(id), do: Repo.get!(Emails, id)

  @doc """
  Creates a emails.

  ## Examples

      iex> create_emails(%{field: value})
      {:ok, %Emails{}}

      iex> create_emails(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
#  def create_emails(attrs \\ %{}) do
#    %Emails{}
#    |> Emails.changeset(attrs)
#    |> Repo.insert()
#  end
#
#  @doc """
#  Updates a emails.
#
#  ## Examples
#
#      iex> update_emails(emails, %{field: new_value})
#      {:ok, %Emails{}}
#
#      iex> update_emails(emails, %{field: bad_value})
#      {:error, %Ecto.Changeset{}}
#
#  """
#  def update_emails(%Emails{} = emails, attrs) do
#    emails
#    |> Emails.changeset(attrs)
#    |> Repo.update()
#  end
#
#  @doc """
#  Deletes a emails.
#
#  ## Examples
#
#      iex> delete_emails(emails)
#      {:ok, %Emails{}}
#
#      iex> delete_emails(emails)
#      {:error, %Ecto.Changeset{}}
#
#  """
#  def delete_emails(%Emails{} = emails) do
#    Repo.delete(emails)
#  end
#
#  @doc """
#  Returns an `%Ecto.Changeset{}` for tracking emails changes.
#
#  ## Examples
#
#      iex> change_emails(emails)
#      %Ecto.Changeset{data: %Emails{}}
#
#  """
#  def change_emails(%Emails{} = emails, attrs \\ %{}) do
#    Emails.changeset(emails, attrs)
#  end
#
#  alias SurveyBackend.Communication.Notifications
#
#  @doc """
#  Returns the list of email.
#
#  ## Examples
#
#      iex> list_email()
#      [%Notifications{}, ...]
#
#  """
#  def list_email do
#    Repo.all(Notifications)
#  end
#
#  @doc """
#  Gets a single notifications.
#
#  Raises `Ecto.NoResultsError` if the Notifications does not exist.
#
#  ## Examples
#
#      iex> get_notifications!(123)
#      %Notifications{}
#
#      iex> get_notifications!(456)
#      ** (Ecto.NoResultsError)
#
#  """
#  def get_notifications!(id), do: Repo.get!(Notifications, id)
#
#  @doc """
#  Creates a notifications.
#
#  ## Examples
#
#      iex> create_notifications(%{field: value})
#      {:ok, %Notifications{}}
#
#      iex> create_notifications(%{field: bad_value})
#      {:error, %Ecto.Changeset{}}
#
#  """
#  def create_notifications(attrs \\ %{}) do
#    %Notifications{}
#    |> Notifications.changeset(attrs)
#    |> Repo.insert()
#  end
#
#  @doc """
#  Updates a notifications.
#
#  ## Examples
#
#      iex> update_notifications(notifications, %{field: new_value})
#      {:ok, %Notifications{}}
#
#      iex> update_notifications(notifications, %{field: bad_value})
#      {:error, %Ecto.Changeset{}}
#
#  """
#  def update_notifications(%Notifications{} = notifications, attrs) do
#    notifications
#    |> Notifications.changeset(attrs)
#    |> Repo.update()
#  end
#
#  @doc """
#  Deletes a notifications.
#
#  ## Examples
#
#      iex> delete_notifications(notifications)
#      {:ok, %Notifications{}}
#
#      iex> delete_notifications(notifications)
#      {:error, %Ecto.Changeset{}}
#
#  """
#  def delete_notifications(%Notifications{} = notifications) do
#    Repo.delete(notifications)
#  end
#
#  @doc """
#  Returns an `%Ecto.Changeset{}` for tracking notifications changes.
#
#  ## Examples
#
#      iex> change_notifications(notifications)
#      %Ecto.Changeset{data: %Notifications{}}
#
#  """
#  def change_notifications(%Notifications{} = notifications, attrs \\ %{}) do
#    Notifications.changeset(notifications, attrs)
#  end

  alias SurveyBackend.Communication.Channels

  @doc """
  Returns the list of channel.

  ## Examples

      iex> list_channel()
      [%Channels{}, ...]

  """
  def list_channel do
    Repo.all(Channels)
  end

  @doc """
  Gets a single channels.

  Raises `Ecto.NoResultsError` if the Channels does not exist.

  ## Examples

      iex> get_channels!(123)
      %Channels{}

      iex> get_channels!(456)
      ** (Ecto.NoResultsError)

  """
  def get_channels!(id), do: Repo.get!(Channels, id)

  @doc """
  Creates a channels.

  ## Examples

      iex> create_channels(%{field: value})
      {:ok, %Channels{}}

      iex> create_channels(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_channels(attrs \\ %{}) do
    %Channels{}
    |> Channels.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a channels.

  ## Examples

      iex> update_channels(channels, %{field: new_value})
      {:ok, %Channels{}}

      iex> update_channels(channels, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_channels(%Channels{} = channels, attrs) do
    channels
    |> Channels.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a channels.

  ## Examples

      iex> delete_channels(channels)
      {:ok, %Channels{}}

      iex> delete_channels(channels)
      {:error, %Ecto.Changeset{}}

  """
  def delete_channels(%Channels{} = channels) do
    Repo.delete(channels)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking channels changes.

  ## Examples

      iex> change_channels(channels)
      %Ecto.Changeset{data: %Channels{}}

  """
  def change_channels(%Channels{} = channels, attrs \\ %{}) do
    Channels.changeset(channels, attrs)
  end

  alias SurveyBackend.Communication.Emails

  @doc """
  Returns the list of email.

  ## Examples

      iex> list_email()
      [%Emails{}, ...]

  """
  def list_email do
    Repo.all(Emails)
  end

  @doc """
  Gets a single emails.

  Raises `Ecto.NoResultsError` if the Emails does not exist.

  ## Examples

      iex> get_emails!(123)
      %Emails{}

      iex> get_emails!(456)
      ** (Ecto.NoResultsError)

  """
  def get_emails!(id), do: Repo.get!(Emails, id)

  @doc """
  Creates a emails.

  ## Examples

      iex> create_emails(%{field: value})
      {:ok, %Emails{}}

      iex> create_emails(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_emails(attrs \\ %{}) do
    %Emails{}
    |> Emails.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a emails.

  ## Examples

      iex> update_emails(emails, %{field: new_value})
      {:ok, %Emails{}}

      iex> update_emails(emails, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_emails(%Emails{} = emails, attrs) do
    emails
    |> Emails.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a emails.

  ## Examples

      iex> delete_emails(emails)
      {:ok, %Emails{}}

      iex> delete_emails(emails)
      {:error, %Ecto.Changeset{}}

  """
  def delete_emails(%Emails{} = emails) do
    Repo.delete(emails)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking emails changes.

  ## Examples

      iex> change_emails(emails)
      %Ecto.Changeset{data: %Emails{}}

  """
  def change_emails(%Emails{} = emails, attrs \\ %{}) do
    Emails.changeset(emails, attrs)
  end
end
