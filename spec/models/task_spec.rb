require 'rails_helper'

RSpec.describe Task, type: :model do
  it "is valid with a title and details" do
    task = Task.new(title: "Test Task", details: "This is a test task.")
    expect(task).to be_valid
  end

  it "is invalid without a title" do
    task = Task.new(details: "This is a test task.")
    expect(task).to_not be_valid
  end

  it "is invalid without details" do
    task = Task.new(title: "Test Task")
    expect(task).to_not be_valid
  end
end
