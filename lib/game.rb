class Game
	attr_reader :game_over

	def initialize(dictionary)
		@dictionary = dictionary
		@game_over = false
	end

	def set_hangman(player)
		@hangman = player

		until @dictionary.is_word_valid?(@word)
			@word = player.get_word
		end
	end

	def set_guesser(player)
		@guesser = player
	end

	def step
		guess = @guesser.get_guess
	end
end