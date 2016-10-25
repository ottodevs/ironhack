require 'pry'

class Game
  attr_reader :space, :current_space

  def initialize(spaces_array)
    @directions = {N: 'north', S: 'south', W: 'west', E: 'east'}
    @spaces = spaces_array
    @current_space = @spaces[0]
    @inventory = []

  end

  def start
    system "clear"
    # the character starts in a room
    print_description
  end

  def print_description
    print "You are in "
    if @current_space.type == "room"
      print "a #{@current_space.name} room"
    else
      print "the #{@current_space.name}"
    end
    @current_space.exits.keys.each do |exit|
      print ". There is a door at the #{@directions[exit]}"
    end
    puts "."
    get_input
  end

  def get_input
    puts ">"
    input = gets.chomp.upcase.split[0].to_sym
    process_command(input) if !@directions.keys.include? input
    ### TODO: inventory
    ### TODO: separate command and directions
    if @current_space.exits.key?(input)
      next_space_index = @spaces.index do |i|
        i.name == @current_space.exits[input]
      end

      @current_space = @spaces[next_space_index]
    else
      puts; puts "There is no exit there."
    end
    puts; print_description
  end

  def process_command(command)
    case command
    when :EXIT
      abort("I hope you enjoyed, human... Good bye")
    when :HELP
      puts "Nobody will help you muahaha!"
      puts "Ok, human, try some of these: N, W, E, S, exit, help, save,
      restore, cry, sing, look, inventory, pick, use"
    when :SAVE
      save_game
    when :RESTORE
      restore_game
    when :CRY
      puts "Are you a baby?"
    when :SING
      puts "Trolololo lolo"
    when :LOOK
      puts "Nothing here..."
    when :INVENTORY
      puts "You have:"
      show_inventory
    when :PICK
      if @current_room.name == "throne"
        puts "Now you have the MAGIC SWORD!!!"
        inventory.push("magic sword");
        @current_room.extras = []
      end
    when :USE
    end

    print_description
  end

  def show_inventory
    inventory.each do |i|
      puts "-#{i.capitalize}"
    end
  end

  def save_game
    game_state = [@spaces, @current_space, @inventory]
    marshaled_game = Marshal.dump(game_state)
    IO.write("gor_slot", marshaled_game)
    puts "Game saved."
  end

  def restore_game
    if File.exist?("gor_slot")
      marshaled_game = IO.read("gor_slot")
      restored = Marshal.load(marshaled_game)
      @spaces = restored[0]
      @current_space = restored[1]
      @inventory = restored[2]
      puts "Game loaded succesfully."
    else
      puts "ERROR!!! I couldn't find the saved game in your harddisk"
    end
  end
end

class Space
  attr_reader :name, :type, :exits, :extras
  # types can be: room, unique
  def initialize(name, type, exits, extras = [])
    @name = name # space name or attribute (north, green, dark...)
    @type = type # type of the space (room, forest...)
    @exits = exits # is a hash with the format {DIRECTION: "space"}
    @extras = extras # array with the extras (bear sleeping, lot of light...)
  end
end

some_spaces =[
  Space.new("dark", "room", {N: "forest", S: "dungeon"}),
  Space.new("forest", "unique", {S: "dark", W: "green"}, "bear sleeping"),
  Space.new("dungeon", "unique", {N: "dark", E: "green"}, "bunch of monsters"),
  Space.new("green", "room", {W: "dungeon", S: "throne", E: "forest"}),
  Space.new("throne", "unique", {N: "green", E: "tunnel"}, "magic sword"),
  Space.new("tunnel", "unique", {W: "throne", E: "exit"}, "final boss"),
  Space.new("exit", "unique", {W: "tunnel"})
]

new_game = Game.new(some_spaces)
new_game.start

#binding.pry