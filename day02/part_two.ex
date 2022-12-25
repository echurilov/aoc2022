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

	def outcome([opponent, "X"]) do #lose
		score = case opponent do
			"A" -> 3 #rock
			"B" -> 1 #paper
			"C" -> 2 #scissors
		end

		score + 0
	end


	def outcome([opponent, "Y"]) do #draw
		score = case opponent do
			"A" -> 1 #rock
			"B" -> 2 #paper
			"C" -> 3 #scissors
		end

		score + 3
	end

	def outcome([opponent, "Z"]) do #win
		score = case opponent do
			"A" -> 2 #rock
			"B" -> 3 #paper
			"C" -> 1 #scissors
		end

		score + 6
	end
end

"input.txt"
|> Tournament.score()