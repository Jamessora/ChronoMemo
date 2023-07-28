require 'rails_helper'

RSpec.describe User, type: :model do
 fixtures :users
 let(:user) { users(:test) }
 let(:category) { categories(:category_1) }
 let(:task_due_today) { tasks(:task_due_today) }

  describe 'associations' do
    it { should have_many(:categories) }
    it { should have_many(:tasks) }
  end

  describe 'validations' do
    subject { user}

    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    
  end

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
