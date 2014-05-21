class Dictionary
	def initialize(dictionary_file)
		load_dictionary(dictionary_file)
	end

	private

	def load_dictionary(dictionary_file)
	  file = File.open(dictionary_file, 'r')
	  @words = file.readlines
	  file.close
	end
end