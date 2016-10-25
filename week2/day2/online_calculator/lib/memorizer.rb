require 'yaml/store'

class Memorizer
  SAVE_FILE = './public/memory.yml'

  def initialize
    @store = YAML::Store.new(SAVE_FILE)
  end

  def save(result)
    @store.transaction do
      @store["m"] = result
    end
  end

  def load
    if File.exists?(SAVE_FILE)
      @store = YAML.load_file(SAVE_FILE)
      @store["m"]
    end
  end
end
