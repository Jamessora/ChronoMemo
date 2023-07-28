require 'rails_helper'

RSpec.describe "Categories", type: :request do

  let(:user) { users(:test) }
  let(:category) { categories(:category_1) }

  describe "GET /categories" do
    context "when user is logged in" do
      before do
        sign_in user
        get categories_path
      end

      it "responds successfully" do
        expect(response).to have_http_status(200)
      end

      it "returns the correct categories for the user" do
        expect(assigns(:categories)).to eq(user.categories)
      end
    end

    context "when user is not logged in" do
      before { get categories_path }

      it "redirects to the login page" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "POST /categories" do
    context "when user is logged in" do
      before { sign_in user }

      it "creates a new category" do
        expect {
          post categories_path, params: { category: { name: "Category name", details: "Category details" } }
        }.to change(user.categories, :count).by(1)
      end

      context "when category is invalid" do
        it "does not create a category" do
          expect {
            post categories_path, params: { category: { name: "", details: "" } }
          }.not_to change(user.categories, :count)
        end
      end
    end

    context "when user is not logged in" do
      it "does not create a category" do
        expect {
          post categories_path, params: { category: { name: "Category name", details: "Category details" } }
        }.not_to change(Category, :count)
      end

      it "redirects to the login page" do
        post categories_path, params: { category: { name: "Category name", details: "Category details" } }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  # Similar tests can be written for other actions like show, edit, update, destroy
end
