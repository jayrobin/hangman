require_relative 'dictionary'

class Hangman
	def initialize
	  load_dictionary
	end

	def new_game
	  print_intro
	end

	private

	def load_dictionary
	  @dictionary = Dictionary.new
	  @dictionary.load("dictionary.txt")
	end

	def print_intro
		puts "Welcome to Hangman"
		puts "James Robinson 2014"
	end
end

Hangman.new