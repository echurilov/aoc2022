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
		|> Enum.map(&count_contained/1)
		|> Enum.sum()
		|> IO.inspect()
	end

	def split_more(ranges) do
		ranges
		|> String.split(",")
		|> Enum.map(fn nums -> String.split(nums, "-") end)
	end

	def count_contained([[low1,high1],[low2,high2]]) do
		cond do
			String.to_integer(low1) <= String.to_integer(low2) and String.to_integer(high1) >= String.to_integer(high2) -> 1 #left fully contains right
			String.to_integer(low2) <= String.to_integer(low1) and String.to_integer(high2) >= String.to_integer(high1) -> 1 #right fully contains left
			true -> 0 #neither fully contains the other
		end
	end
end

"input.txt"
 |> Cleanup.compare()

# "2-4,6-8
# 2-3,4-5
# 5-7,7-9
# 2-8,3-7
# 6-6,4-6
# 2-6,4-8"
# |> Cleanup.parse()