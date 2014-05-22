require_relative 'player'

class AIPlayer < Player
	def initialize(name, dictionary)
	  super(name)

	  # AI requires access to dictionary as both hangman and guesser
	  @dictionary = dictionary
	end
end