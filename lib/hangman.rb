require_relative 'dictionary'

class Hangman
	def initialize
	  @dictionary = Dictionary.new
	  @dictionary.load("dictionary.txt")
	end
end