require_relative 'player'

class AIPlayer < Player
	NoAvailableLettersError = Class.new(StandardError)

	def initialize(name, dictionary)
	  super(name)

	  # AI requires access to dictionary as both hangman and guesser
	  @dictionary = dictionary

	  @letters = ('a'..'z').to_a
	end

	def get_word
		@dictionary.get_random_word
	end

	def get_guess(used_letters)
		available_letters = (('a'..'z').to_a - used_letters)

		raise NoAvailableLettersError if available_letters.size == 0

		available_letters.sample
	end

	def get_save_data
	  save_data = super
	  save_data['type'] = "c"

	  save_data
	end
end