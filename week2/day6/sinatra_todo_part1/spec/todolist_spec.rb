require './todolist'

describe Task do
  #before(:each) { @task = Task.new("Buy the milk") }
  let(:task) { Task.new("Buy the milk") }

  describe '#initialize' do
    it 'creates a new task with content = "Buy the milk"' do
      expect(task.content).to eq('Buy the milk')
    end
  end

  describe '#id' do
    it 'creates a new task with id = 2' do
      expect(task.id).to eq(2)
    end
  end

  describe '#completed?' do
    it 'shows task completion status' do
      expect(task.completed?).to eq(false)
    end
  end

  describe '#complete!' do
    it 'completes the task' do
      expect(task.complete!).to eq(true)
    end
  end

  describe '#make_incomplete!' do
    it 'changes the status of the task to completed = false' do
      task.complete!
      expect(task.make_incomplete!).to eq(false)
    end
  end

  describe '#created_at' do
    it 'returns the creation date and time' do
      expect(task.created_at.iso8601).to eq(DateTime.now.iso8601)
    end
  end

  describe '#update_content!' do
    it 'changes the content of a task' do
      task.update_content!("Buy a dog")
      expect(task.content).to eq("Buy a dog")
    end

    it 'changes the update date and time' do
      expect(task.updated_at).to eq(nil)
      task.update_content!("Buy a dog")
      expect(task.updated_at).not_to eq(nil)
    end
  end
end

describe TodoList do
  let(:task) { Task.new("Finish my todolist")}
  let(:todolist) { TodoList.new('Otto')}

  describe '#initialize' do
    it 'adds a user to the new todolist' do
      expect(todolist.user).to eq('Otto')
    end
  end

  describe '#add_task' do
    it 'adds a new task to the todolist tasks' do
      todolist.add_task(task)
      expect(todolist.tasks.include? task).to eq(true)
    end
  end

  describe '#delete_task' do
    it 'deletes a task by its id' do
      todolist.delete_task(task.id)
      expect(todolist.tasks.include? task).to eq(false)
    end
  end

  describe '#find_task_by_id' do
    it 'finds a task by its id' do
      todolist.add_task(task)
      expect(todolist.find_task_by_id(task.id)).to equal(task)
      expect(todolist.find_task_by_id(task.id)).not_to eq(nil)
    end

    it 'returns nil if task is not found for that id' do
      t = Task.new ''
      expect(todolist.find_task_by_id(t.id)).to equal(nil)
    end
  end

  describe '#sort_by_created' do
    it 'returns an array sorted by creation date' do
      task1 = Task.new 'one'
      task2 = Task.new 'two'
      task3 = Task.new 'three'
      tasks_array = [task1, task2, task3]
      todolist.add_task(task2)
      todolist.add_task(task1)
      todolist.add_task(task3)
      expect(todolist.sort_by_created('ASC')).to eq(tasks_array)
      expect(todolist.sort_by_created('DESC')).to eq(tasks_array.reverse)
    end
  end

  describe '#save' do
    it 'saves the tasks for that user' do
      todo_list = TodoList.new("Josh")
      task = Task.new("Walk the dog")
      task2 = Task.new("Buy the milk")
      task3 = Task.new("Make my todo list into a web app")
      [task, task2, task3].each { |t| todo_list.add_task t }
      todo_list.save
      SAVE_FILE = './public/tasks.yml'
      expect(File.exists? SAVE_FILE).to eq(true)
    end
  end

  describe '#load_tasks' do
    it 'load the saved tasks for that user' do
      todo_list = TodoList.new("Josh")
      todo_list.load_tasks
      expect(todo_list.load_tasks.length).to eq(3)
    end
  end
end
