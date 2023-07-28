require 'rails_helper'

RSpec.describe TasksHelper, type: :helper do
  fixtures :tasks
  fixtures :users

  describe '#tasks_due_today' do
    it 'should return tasks due today' do
      user = users(:test)
      due_today_tasks = tasks_due_today(user)
      expect(due_today_tasks).to include(tasks(:task_due_today))
      expect(due_today_tasks).not_to include(tasks(:task_not_due_today))
      expect(due_today_tasks).not_to include(tasks(:overdue_task))
    end
  end

  describe '#tasks_not_due_today' do
    it 'should return tasks not due today' do
      user = users(:test)
      not_due_today_tasks = tasks_not_due_today(user)
      expect(not_due_today_tasks).to include(tasks(:task_not_due_today))
      expect(not_due_today_tasks).to include(tasks(:overdue_task))
      expect(not_due_today_tasks).not_to include(tasks(:task_due_today))
    end
  end

  describe '#sort_tasks' do
    it 'should sort tasks correctly' do
      user = users(:test)
      tasks_array = [tasks(:task_due_today), tasks(:task_not_due_today), tasks(:overdue_task)]
      sorted_tasks = sort_tasks(tasks_array)
      expect(sorted_tasks[0]).to eq(tasks(:overdue_task))
      expect(sorted_tasks[1]).to eq(tasks(:task_due_today))
      expect(sorted_tasks[2]).to eq(tasks(:task_not_due_today))
    end
  end
end