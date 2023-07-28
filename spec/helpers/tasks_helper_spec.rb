require 'rails_helper'

RSpec.describe TasksHelper, type: :helper do
  let(:user) { users(:test) }  # use fixture
  let!(:task_due_today) { tasks(:task_due_today) }  # use fixture
  let!(:task_not_due_today) { tasks(:task_not_due_today) }  # use fixture
  let!(:overdue_task) { tasks(:overdue_task) }  # use fixture

  describe "#tasks_due_today" do
    it "returns tasks due today and not completed" do
      expect(helper.tasks_due_today(user)).to include(task_due_today)
      expect(helper.tasks_due_today(user)).not_to include(task_not_due_today)
      expect(helper.tasks_due_today(user)).not_to include(overdue_task)
    end
  end

  describe "#tasks_not_due_today" do
    it "returns tasks not due today and not completed" do
      expect(helper.tasks_not_due_today(user)).to include(task_not_due_today)
      expect(helper.tasks_not_due_today(user)).to include(overdue_task)
      expect(helper.tasks_not_due_today(user)).not_to include(task_due_today)
    end
  end
end
