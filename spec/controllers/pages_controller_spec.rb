require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  let(:user) { users(:test) }
  let(:category) { categories(:category_1) }
  let(:task_due_today) { tasks(:task_due_today) }
  let(:task_not_due_today) { tasks(:task_not_due_today) }
  let(:overdue_task) { tasks(:overdue_task) }

  describe 'GET #home' do
    context 'when a user is logged in' do
      before do
        sign_in user
      end

      it 'renders the :home template' do
        get :home
        expect(response).to render_template(:home)
      end

      it 'assigns tasks due today to @tasks_due_today' do
        get :home
        expect(assigns(:tasks_due_today)).to include(task_due_today)
      end

      it 'assigns tasks not due today to @tasks_not_due_today' do
        get :home
        expect(assigns(:tasks_not_due_today)).to include(task_not_due_today)
      end

      it 'assigns overdue tasks to @overdue_tasks' do
        get :home
        expect(assigns(:overdue_tasks)).to include(overdue_task)
      end
    end

    context 'when a user is not logged in' do
      it 'redirects to the login page' do
        get :home
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
