require_relative 'dictionary'
require_relative 'game'

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
		game = Game.new
		game
	end
end