require 'rails_helper'

RSpec.describe Category, type: :model do
  it "is valid with a name and details" do
    category = Category.new(name: "Test Category", details: "This is a test category.")
    expect(category).to be_valid
  end

  it "is invalid without a name" do
    category = Category.new(details: "This is a test category.")
    expect(category).to_not be_valid
  end

  it "is invalid without details" do
    category = Category.new(name: "Test Category")
    expect(category).to_not be_valid
  end
end
