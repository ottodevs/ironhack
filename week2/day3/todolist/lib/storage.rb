require 'yaml/store'

module Store
  SAVE_FILE = './public/tasks.yml'

  def storage_start
    @store = YAML::Store.new(SAVE_FILE)
  end

  def store(user, tasks)
    @store.transaction do
      @store[user] = tasks
    end
  end

  def load(user)
    if File.exists?(SAVE_FILE)
      @store = YAML.load_file(SAVE_FILE)
      @store[user]
    end
  end
end
