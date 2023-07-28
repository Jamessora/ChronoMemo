require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:user) { users(:test) }
  let(:category) { categories(:category_1) }
  let(:task) { tasks(:task_due_today) }

  before do
    sign_in user
  end

  describe "GET #index" do
    context "with category_id parameter" do
      it "assigns tasks of the category to @tasks" do
        get :index, params: { category_id: category.id }
        expect(assigns(:tasks)).to match_array(category.tasks.where(user_id: user.id))
      end
    end

    context "without category_id parameter" do
      it "assigns all tasks of the user to @tasks" do
        get :index
        expect(assigns(:tasks)).to match_array(Task.where(user_id: user.id).order(completed: :asc, date_due: :asc))
      end
    end
  end

  describe "GET #show" do
    it "renders the :show template" do
      get :show, params: { id: task.id }
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "assigns a new Task to @task" do
      get :new
      expect(assigns(:task)).to be_a_new(Task)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new task" do
        expect {
          post :create, params: { task: { title: "New task", details: "Task details", date_due: Time.zone.now, category_id: category.id } }
        }.to change(Task, :count).by(1)
      end

      it "redirects to the new task" do
        post :create, params: { task: { title: "New task", details: "Task details", date_due: Time.zone.now, category_id: category.id } }
        expect(response).to redirect_to(Task.last)
      end
    end

    context "with invalid attributes" do
      it "does not save the new task" do
        expect {
          post :create, params: { task: { title: "", details: "", date_due: nil, category_id: nil } }
        }.to_not change(Task, :count)
      end

      it "re-renders the new method" do
        post :create, params: { task: { title: "", details: "", date_due: nil, category_id: nil } }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    it "updates the task" do
      put :update, params: { id: task.id, task: { title: "Updated task", details: "Updated details", date_due: Time.zone.now, category_id: category.id } }
      task.reload
      expect(task.title).to eq("Updated task")
      expect(task.details).to eq("Updated details")
    end
  end

  describe 'DELETE #destroy' do
    it "deletes the task" do
      expect {
        delete :destroy, params: { id: task.id }
      }.to change(Task, :count).by(-1)
    end

    it "redirects to tasks#index" do
      delete :destroy, params: { id: task.id }
      expect(response).to redirect_to tasks_url
    end
  end
end
