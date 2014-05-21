class Dictionary

	def initialize
		@words = []
	end

	def load_dictionary(dictionary_file, min_word_len=0, max_word_len=99)
	  file = File.open(dictionary_file, 'r')

	  # load words into array and strip short/long words as required
	  @words = file.readlines.select { |word| word.size.between?(min_word_len, max_word_len) }
	  
	  file.close
	end

	def get_random_word
		@words.sample
	end
end