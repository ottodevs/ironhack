require "ruby-dictionary"
require "pry"
class WordChain
	attr_accessor :dictionary

	def initialize(dictionary)
		@dictionary = dictionary
	end

	def find_chain(start_word, end_word)
		puts start_word
		start_word.chars.each_with_index do |current_char, current_index| # iterate start_word letters
			if start_word[current_index] != end_word[current_index] # if the chars are not the same
				start_word[current_index] = end_word[current_index] # assign the current end_word char to the start_word
				if !dictionary.exists?start_word # if the new start_word is not found on dictionary
					start_word[current_index] = current_char # revert the change to the start_word
				else
					puts start_word # else we have our valid word
				end
			end
		end
		puts end_word
	end
end

dictionary = Dictionary.from_file("/usr/share/dict/words")

my_chain = WordChain.new(dictionary)
my_chain.find_chain("cat", "dog")
my_chain.find_chain("lead", "gold")
my_chain.find_chain("ruby", "code")


