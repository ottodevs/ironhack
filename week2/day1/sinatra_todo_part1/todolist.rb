require 'date'
require 'yaml/store'

module Persistence
  SAVE_FILE = './public/tasks.yml'

  def persistence_start
    @store = YAML::Store.new(SAVE_FILE)
  end

  def persist(user, tasks)
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

class Task
  attr_reader :content, :id, :created_at, :updated_at
  @@current_id = 1

  def initialize(content)
    @content = content
    @id = @@current_id
    @@current_id += 1
    @completed = false
    @created_at = DateTime.now
    @updated_at = nil
  end

  def completed?
    @completed
  end

  def complete!
    @completed = true
  end

  def make_incomplete!
    @completed = false
  end

  def update_content!(content)
    @content = content
    @updated_at = DateTime.now
  end
end

class TodoList
  include Persistence

  attr_reader :tasks, :user

  def initialize(user)
    persistence_start
    @tasks = []
    @user = user
  end

  def add_task(task)
    @tasks << task if task.is_a? Task
  end

  def delete_task(id)
    @tasks.delete_if { |i| i == id }
  end

  def find_task_by_id(id)
    @tasks.select { |t| t.id == id }
    .first
  end

  def sort_by_created(order)
    case order.upcase
    when 'ASC'
      @tasks.sort { |t1, t2| t1.created_at <=> t2.created_at }
    when 'DESC'
      @tasks.sort { |t1, t2| t2.created_at <=> t1.created_at }
    end
  end

  def save
    persist(@user, @tasks)
  end

  def load_tasks
    @tasks = load(@user)
  end
end

