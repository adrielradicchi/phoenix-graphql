defmodule WabanexWeb.Resolvers.Training do
  alias Wabanex.Trainings.Create

  # def get(%{id: user_id}, _context), do: Get.call(user_id)
  def create(%{input: params}, _context), do: Create.call(params)
end
