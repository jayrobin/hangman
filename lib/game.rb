class Game
	def initialize(dictionary)
		@dictionary = dictionary
	end
	
	def set_hangman(player)
		@hangman = player
	end

	def set_guesser(player)
		@guesser = player
	end
end