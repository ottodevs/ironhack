class Terminal
  def run
    system "clear"

    username = get_username
    password = get_password

    if try_login?(username, password)
      puts "\nEnter some text:"
      @text = gets.chomp
      show_menu
    else
      puts "Wrong credentials, press enter to continue"; gets
      run
    end
  end

  def get_username
    puts "Username:"
    gets.chomp
  end

  def get_password
    puts "Password:"
    gets.chomp
  end

  def try_login?(username, password)
    credentials = {
      "alice" => "secret",
      "bob" => "123"
    }
    credentials[username] == password
  end

  def count_words
    puts "Words in your text: #{@text.split.size}"
  end

  def count_letters
    puts "Letters in your text: #{@text.split.join.size}"
  end

  def reverse_text
    puts "Your text reversed: #{@text.reverse}"
  end

  def convert_uppercase
    puts "Your text in CAPS: #{@text.upcase}"
  end

  def convert_lowercase
    puts "Your text downcased: #{@text.downcase}"
  end

  def exit
    abort("Bye, master")
  end

  def show_menu
    opts = {
      count_words: "Count words",
      count_letters: "Count letters",
      reverse_text: "Reverse the text",
      convert_uppercase:"Convert to uppercase",
      convert_lowercase:  "Convert to lowercase",
      exit: "Exit this program"
    }
    puts "\nSelect an option:"
    opts.values.each { |o| puts "#{opts.values.index(o) + 1}. #{o}" }
    print ":> "
    require 'io/console'
    send(opts.keys[STDIN.getch.to_i - 1])
    show_menu
  end
end

  cmd = Terminal.new.run