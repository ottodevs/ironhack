def solve_cipher(input, shift=-3)
	s = ''

	input.split('').each do |c|
		next s << ' ' if c[' '] # to skip when our char is space
		
		n = c.ord + shift
		# another approach adding here this condition:
		# n = 122 if n < 97
		# and then return "s" string at it is

		s << n.chr
	end

	puts s.gsub 96.chr, "z"
end

solve_cipher("ifmmp", -1)
# should return "hello"

solve_cipher("aaa", -1)
# should return "zzz"

solve_cipher("p| uhdo qdph lv grqdog gxfn")
