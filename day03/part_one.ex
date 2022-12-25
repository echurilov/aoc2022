defmodule Rucksack do
	def packing(file) do
		{:ok, input} = file
		|> File.read()

		input
		|> String.trim_trailing()
		|> String.split(~r{\n})
		|> Enum.map(&halve/1)
		|> Enum.map(&priority/1)
		|> Enum.sum()
		|> IO.inspect()
	end

	def halve(rucksack) do
		middle = rucksack
		|> String.length()
		|> div(2)

		rucksack
		|> String.split_at(middle)
		|> Tuple.to_list()
	end

	def priority([first,last]) do
		<<char::utf8>> = String.myers_difference(first, last)[:eq]
		|> String.first()
		
		cond do 
			char > 96 -> char - 96
			char <= 96 -> char - 38
		end
	end
end

"input.txt"
|> Rucksack.packing()

