require_relative 'dictionary'
require_relative 'game'
require_relative 'ai_player'
require_relative 'human_player'

class Hangman
	def initialize
	  load_dictionary
	end

	def new_game
	  print_intro

	  @game = init_game
	end

	private

	def load_dictionary
	  @dictionary = Dictionary.new
	  @dictionary.load("dictionary.txt")
	end

	def print_intro
		puts "Welcome to Hangman"
		puts "By James Robinson (2014)"
	end

	def init_game
		game = Game.new(@dictionary)

		puts "Should the hangman be a (h)uman or (c)omputer player? "
		game.set_hangman(get_new_player)

		puts "Should the guesser be a (h)uman or (c)omputer player? "
		game.set_guesser(get_new_player)

		game
	end

	def get_new_player
		player = nil
		while player.nil?
			print ": "
			player_type = gets.chomp

			player = case player_type
				when "c" then AIPlayer.new("Computer")
				when "h" then get_new_human_player
			  else nil
			end
		end

		player
	end

	def get_new_human_player
		print "Enter a name for the player: "
		HumanPlayer.new(gets.chomp)
	end
end