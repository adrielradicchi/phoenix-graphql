defmodule Wabanex.Training do
  use Ecto.Schema
  import Ecto.Changeset

  alias Wabanex.{Exercise, User}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @fields [:end_date, :start_date]

  schema "trainings" do
    field :end_date, :date
    field :start_date, :date

    belongs_to :user, User
    has_many :exercises, Exercise, foreign_key: :training_id

    timestamps()
  end

  def changeset(params, training \\ %__MODULE__{}) do
    training
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> cast_assoc(:exercises)
  end
end
