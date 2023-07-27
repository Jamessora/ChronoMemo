require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { users(:test) }
  let(:category) { categories(:category_1) }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:tasks).dependent(:destroy) }
  end

  describe 'validations' do
    subject { category }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:details) }
  end

  describe "tasks dependency" do
    it "should destroy tasks when category is destroyed" do
      category = Category.create!(user: user, name: "Category 1", details: "Some details")
      task = Task.create!(user: user, category: category, title: 'Test Task 1', details: 'Details of task 1', date_due: Time.zone.now.midnight)

      expect {
        category.destroy
      }.to change(Task, :count).by(-1)
    end
  end
end