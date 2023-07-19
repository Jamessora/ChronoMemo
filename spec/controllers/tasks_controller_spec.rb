# spec/controllers/tasks_controller_spec.rb
require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe "POST #create" do
    it "creates a new task" do
      expect {
        post :create, params: { task: { title: "New Task", details: "This is a new task." } }
      }.to change(Task, :count).by(1)
    end

    it "redirects to the newly created task" do
      post :create, params: { task: { title: "New Task", details: "This is a new task." } }
      expect(response).to redirect_to(Task.last)
    end
  end

  # Similar tests for other controller actions (index, show, update, destroy) can be added here.
end
