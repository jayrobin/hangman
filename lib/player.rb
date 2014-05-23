class Player
	attr_reader :name

	def initialize(name)
		@name = name
	end

	def get_word; end
	def get_guess(used_letters); end

	def give_guess_feedback(used_letters, word_state, turns_remaining)
		puts "Word: #{word_state}"
		puts "Guesses: #{used_letters.join(", ")}"
		puts "#{turns_remaining} turns remaining"
		puts "\n"
	end
end