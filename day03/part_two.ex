defmodule Rucksack do
	def packing(file) do
		{:ok, input} = file
		|> File.read()

		input
		|> String.trim_trailing()
		|> String.split(~r{\n})
		|> Enum.chunk_every(3)
		|> Enum.map(&priority/1)
		|> Enum.sum()
		|> IO.inspect()
	end

	def priority([first,second,third]) do
		elf1 = first
		|> String.graphemes()
		|> MapSet.new()

		elf2 = second
		|> String.graphemes()
		|> MapSet.new()

		elf3 = third
		|> String.graphemes()
		|> MapSet.new()

		[<<char::utf8>>] = elf1
		|> MapSet.intersection(elf2)
		|> MapSet.intersection(elf3)
		|> MapSet.to_list()

		cond do 
			char > 96 -> char - 96
			char <= 96 -> char - 38
		end
	end
end

"input.txt"
|> Rucksack.packing()

