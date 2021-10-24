defmodule WabanexWeb.Resolvers.User do
  alias Wabanex.Users.{Create, Get}

  def get(%{id: user_id}, _context), do: Get.call(user_id)
  def create(%{input: params}, _context), do: Create.call(params)
end
