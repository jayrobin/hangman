require_relative 'player'

class HumanPlayer < Player
	def get_word
		print "Enter word: "
		gets.chomp
	end
end