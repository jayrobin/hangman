class Game
	MAX_TURNS = 10

	attr_reader :game_over, :winner

	def initialize(dictionary)
		@dictionary = dictionary
		@game_over = false
		@used_letters = {}
		@turns_taken = 0
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
		guess = @guesser.get_guess(@used_letters.keys) until is_valid_guess?(guess)
		@turns_taken += 1

		@used_letters[guess] = true
		@guesser.give_guess_feedback(@used_letters.keys, get_word_state, MAX_TURNS - @turns_taken)

		@game_over = is_game_over?
	end

	private

	def is_valid_guess?(guess)
		!(@used_letters[guess] || guess.nil?)
	end

	def get_word_state
  	@word.split(//).map { |letter| @used_letters[letter] ? letter : "_" }.join
	end

	def is_game_over?
		@winner = @guesser if get_word_state == @word
		@winner = @hangman if @winner.nil? && @turns_taken == MAX_TURNS
		
		!@winner.nil?
	end
end