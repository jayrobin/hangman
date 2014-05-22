class Game
	def initialize(dictionary)
		@dictionary = dictionary
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
end