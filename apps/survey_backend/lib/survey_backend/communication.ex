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
