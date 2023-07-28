require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  let(:user) { users(:test) }
  let(:category1) { categories(:category_1) }
  let(:category2) { categories(:category_2) }
  let(:task_due_today) { tasks(:task_due_today) }
  let(:task_not_due_today) { tasks(:task_not_due_today) }
  let(:overdue_task) { tasks(:overdue_task) }

  before do
    sign_in user
  end

  describe "GET #home" do
    context "when there is no category_id in params" do
      before { get :home }

      it "assigns all tasks of the current user to @tasks" do
        expect(assigns(:tasks)).to match_array([task_due_today, task_not_due_today, overdue_task])
      end

      it "assigns all categories of the current user to @categories" do
        get :home, params: { user_id: user.id }
        expect(assigns(:categories).to_a).to match_array([category1, category2])
      end
    end

    context "when there is category_id in params" do
      before { get :home, params: { category_id: category1.id } }

      it "assigns tasks of the current category to @tasks" do
        expect(assigns(:tasks)).to match_array([task_due_today, task_not_due_today, overdue_task])
      end

      it "assigns all categories of the current user to @categories" do
        get :home, params: { user_id: user.id }
        expect(assigns(:categories).to_a).to match_array([category1, category2])
      end
    end
  end
end
