require 'rails_helper'

RSpec.describe "Tasks", type: :request do

  let(:user) { users(:test) }
  let(:category) { categories(:category_1) }
  let(:task_due_today) { tasks(:task_due_today) }
  let(:task_not_due_today) { tasks(:task_not_due_today) }
  let(:overdue_task) { tasks(:overdue_task) }

  describe "GET /tasks" do
    context "when user is logged in" do
      before do
        sign_in user
        get tasks_path
      end

      it "responds successfully" do
        expect(response).to have_http_status(200)
      end
    end

    context "when user is not logged in" do
      before { get tasks_path }

      it "redirects to the login page" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "POST /tasks" do
    context "when user is logged in" do
      before { sign_in user }

      it "creates a new task" do
        expect {
          post tasks_path, params: { task: { title: "Task title", details: "Task details", date_due: Date.tomorrow, category_id: category.id } }
        }.to change(user.tasks, :count).by(1)
      end
    end

    context "when user is not logged in" do
      it "does not create a task" do
        expect {
          post tasks_path, params: { task: { title: "Task title", details: "Task details", date_due: Date.tomorrow, category_id: category.id } }
        }.not_to change(Task, :count)
      end

      it "redirects to the login page" do
        post tasks_path, params: { task: { title: "Task title", details: "Task details", date_due: Date.tomorrow, category_id: category.id } }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  # Similar tests can be written for other actions like show, edit, update, destroy
end
