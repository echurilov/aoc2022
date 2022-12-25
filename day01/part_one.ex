defmodule Elf do
	def richest(elves) do
		{:ok, input} = elves
		|> File.read()

		input
		|> String.trim_trailing()
		|> String.split(~r{\n\n})
		|> Enum.map(fn x -> String.split(x, ~r{\n}) end)
		|> Enum.map(&calories/1)
		|> Enum.max()
		|> IO.puts()
	end

	def calories(elf) do
		elf
		|> Enum.map(&String.to_integer/1)
		|> Enum.sum()
	end
end

"input.txt"
|> Elf.richest()