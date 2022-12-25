defmodule Cleanup do
	def compare(file) do
		{:ok, input} = file
		|> File.read()
		
		parse(input)
	end

	def parse(input) do
		input
		|> String.trim_trailing()
		|> String.split(~r{\n})
		|> Enum.map(&split_more/1)
		|> Enum.map(&count_overlapping/1)
		|> Enum.sum()
		|> IO.inspect()
	end

	def split_more(ranges) do
		ranges
		|> String.split(",")
		|> Enum.map(fn nums -> String.split(nums, "-") end)
	end

	def count_overlapping([[low1,high1],[low2,high2]]) do
		cond do
			String.to_integer(low1) <= String.to_integer(low2) and String.to_integer(high1) >= String.to_integer(high2) -> 1 #left fully contains right
			String.to_integer(low2) <= String.to_integer(low1) and String.to_integer(high2) >= String.to_integer(high1) -> 1 #right fully contains left
			String.to_integer(low1) <= String.to_integer(low2) and String.to_integer(high1) >= String.to_integer(low2) -> 1 #overlap with left lower
			String.to_integer(low2) <= String.to_integer(low1) and String.to_integer(high2) >= String.to_integer(low1) -> 1 #overlap with right lower
			true -> 0 #ranges are disjoint
		end
	end
end

"input.txt"
 |> Cleanup.compare()