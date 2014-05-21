class Dictionary

	def initialize
		@words = []
	end

	def load_dictionary(dictionary_file, min_word_len=0, max_word_len=99)
	  file = File.open(dictionary_file, 'r')
	  contents = file.read

	  @words = contents.split(/[\r\n]+/)

	  # load words into array and strip short/long words as required
	  @words = @words.select { |word| word.size.between?(min_word_len, max_word_len) }
	  @words = @words.map(&:downcase)

	  file.close
	end

	def get_random_word
		@words.sample
	end

	def is_word_valid(word)
		@words.include?(word)
	end
end