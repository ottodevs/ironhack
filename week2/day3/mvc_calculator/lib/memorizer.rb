require 'yaml/store'

class Memorizer
  SAVE_FILE = './public/memory.yml'

  def self.save(result)
    @store = YAML::Store.new(SAVE_FILE)
    @store.transaction do
      @store["m"] = result
    end
  end

  def self.load
    @store = YAML::Store.new(SAVE_FILE)
    if File.exists?(SAVE_FILE)
      @store = YAML.load_file(SAVE_FILE)
      @store["m"]
    end
  end
end
