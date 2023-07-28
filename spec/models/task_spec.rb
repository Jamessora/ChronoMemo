require 'rails_helper'

RSpec.describe Task, type: :model do
  fixtures :tasks

  let(:task_due_today) { tasks(:task_due_today) }
  let(:task_not_due_today) { tasks(:task_not_due_today) }
  let(:overdue_task) { tasks(:overdue_task) }

  it "is valid with a title and details" do
    expect(task_due_today).to be_valid
  end

  it "is invalid without a title" do
    task_due_today.title = nil
    expect(task_due_today).to_not be_valid
  end

  it "is invalid without details" do
    task_due_today.details = nil
    expect(task_due_today).to_not be_valid
  end
end
