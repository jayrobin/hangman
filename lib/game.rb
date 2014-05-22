class Game
	attr_reader :game_over

	def initialize(dictionary)
		@dictionary = dictionary
		@game_over = false
		@used_letters = []
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
		guess = @guesser.get_guess(@used_letters) until is_valid_guess?(guess)

		@used_letters << guess
		puts get_word_state.join
	end

	private

	def is_valid_guess?(guess)
		!(@used_letters.include?(guess) || guess.nil?)
	end

	def get_word_state
  	@word.split(//).map do |letter|
  		@used_letters.include?(letter) ? letter : "_"
  	end
	end
end