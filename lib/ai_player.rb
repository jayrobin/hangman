require_relative 'player'

class AIPlayer < Player
	def initialize(name, dictionary)
	  super(name)

	  # AI requires access to dictionary as both hangman and guesser
	  @dictionary = dictionary

	  @letters = ('a'..'z').to_a
	end

	def get_word
		@dictionary.get_random_word
	end

	def get_guess
		@letters.delete_at(rand(@letters.size))
	end
end