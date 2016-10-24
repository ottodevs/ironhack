require 'ruby-dictionary'
require "pry"

class WordChain
  attr_accessor :dictionary

  def initialize(dictionary)
    @dictionary = dictionary
  end

  def find_chain(start_word, end_word)
    puts start_word

    start_word.chars.each_with_index do |current_char, index| # iterate start_word letters
      if start_word[index] != end_word[index] # if the chars are not the same
        start_word[index] = end_word[index] # assign the current end_word char to the start_word
        #binding.pry
        if !dictionary.exists?start_word # if the new start_word is not found on dictionary
          start_word[index] = current_char # revert the change to the start_word
        else
          if start_word != end_word # if we still didn't finish
            find_chain(start_word, end_word) # try to start over from the first char
          else
            puts "#{end_word}\n\n" # if we reach this point we finished.
          end
        end
      end
    end
  end
end

dictionary = Dictionary.from_file("/usr/share/dict/words")

my_chain = WordChain.new(dictionary)
# my_chain.find_chain("cat", "dog")
my_chain.find_chain("ruby", "code")
# my_chain.find_chain("fish", "duct")
# my_chain.find_chain("mad", "car")

# # problematic words
# my_chain.find_chain("book", "gave")
my_chain.find_chain("gold", "lead")
# my_chain.find_chain("duck", "ruby")
