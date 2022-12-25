defmodule Tournament do
	def score(file) do
		{:ok, input} = file
		|> File.read()

		input
		|> String.trim_trailing()
		|> String.split(~r{\n})
		|> Enum.map(fn x -> String.split(x, ~r{\s}) end)
		|> Enum.map(&outcome/1)
		|> Enum.sum()
		|> IO.inspect()
	end

	def outcome([opponent, "X"]) do #rock
		score = case opponent do
			"A" -> 3 #rock
			"B" -> 0 #paper
			"C" -> 6 #scissors
		end

		score + 1
	end


	def outcome([opponent, "Y"]) do #paper
		score = case opponent do
			"A" -> 6 #rock
			"B" -> 3 #paper
			"C" -> 0 #scissors
		end

		score + 2
	end

	def outcome([opponent, "Z"]) do #scissors
		score = case opponent do
			"A" -> 0 #rock
			"B" -> 6 #paper
			"C" -> 3 #scissors
		end

		score + 3
	end
end

"input.txt"
|> Tournament.score()