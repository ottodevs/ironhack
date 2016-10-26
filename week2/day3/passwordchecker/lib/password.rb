class PasswordChecker

	def check_password(email, password)

		unless password.length > 7
			return false
		end

		unless password.index(/[[:alpha:]]/)
			return false
		end

		unless password[/\d/] 
			return false
		end

		unless password.index(/[^[:alnum:]]/)
			return false
		end

		unless password.index(/[[:lower:]]/)
			return false
		end

		unless password.index(/[[:upper:]]/)
			return false
		end

		array = email.split("@")
		user = array.first
		domain = array.last.split(".").first

		if password.match(user)
			return false
		end

		if password.match(domain)
			return false
		end

		true


	end

end