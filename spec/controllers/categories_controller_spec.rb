# spec/controllers/categories_controller_spec.rb
require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe "POST #create" do
    it "creates a new category" do
      expect {
        post :create, params: { category: { name: "New Category", details: "This is a new category." } }
      }.to change(Category, :count).by(1)
    end

    it "redirects to the newly created category" do
      post :create, params: { category: { name: "New Category", details: "This is a new category." } }
      expect(response).to redirect_to(Category.last)
    end
  end

  # Similar tests for other controller actions (index, show, update, destroy) can be added here.
end
