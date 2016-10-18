def word_sorting(phrase)
	array = phrase.split
	array.each do |i|
		i.gsub!(/\W/, '') # removes punctuation
	end
	array.sort_by(&:downcase)
end

phrases = [
	"Have a nice day.",
	"Fools fall for foolish follies.",
	"Ruby is a fun language!"
]

phrases.each { |p| print "#{word_sorting(p)}\n" }