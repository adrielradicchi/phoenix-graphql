defmodule Wabanex.IMC do
  def calculate(%{"file_name" => file_name}) do
    file_name
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, content}) do
    content
    |> String.split("\n")
    |> Enum.map(&parse_line/1)
    |> Enum.into(%{})
  end

  defp handle_file({:error, reason}), do: reason

  defp parse_line(line) do
    line
    |> String.split(",")
    |> List.update_at(1, &String.to_float/1)
    |> List.update_at(2, &String.to_float/1)
    |> calculate_imc()
  end

  defp calculate_imc([name, height, weight]), do: {name, weight / (height * height)}
end
