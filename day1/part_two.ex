# add to array sum newlines, new elf on empty line, sort to find highest
defmodule Elf do
	def richest(elves) do
		{:ok, input} = elves
		|> File.read()

		input
		|> String.trim_trailing()
		|> String.split(~r{\n\n})
		|> Enum.map(fn x -> String.split(x, ~r{\n}) end)
		|> Enum.map(&calories/1)
		|> Enum.sort()
		|> Enum.take(-3)
		|> Enum.sum()
		|> IO.inspect()
	end

	def calories(elf) do
		elf
		|> Enum.map(&String.to_integer/1)
		|> Enum.sum()
	end
end

"input.txt"
|> Elf.richest()