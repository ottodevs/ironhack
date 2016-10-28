require 'storage'

class TodoList
  include Storage

  attr_reader :tasks, :user

  def initialize(user)
    storage_start
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
    store(@user, @tasks)
  end

  def load_tasks
    @tasks = load(@user)
  end
end
