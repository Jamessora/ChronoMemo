require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { users(:test) }
  let(:category) { categories(:category_1) }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "assigns all categories to @categories" do
      get :index
      expect(assigns(:categories)).to eq(user.categories)
    end
  end

  describe "GET #show" do
    it "assigns the requested category to @category" do
      get :show, params: { id: category.id }
      expect(assigns(:category)).to eq(category)
    end
  end

  describe "GET #new" do
    it "assigns a new Category to @category" do
      get :new
      expect(assigns(:category)).to be_a_new(Category)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new category" do
        expect {
          post :create, params: { category: { name: "New category", details: "Details about new category" } }
        }.to change(Category, :count).by(1)
      end

      it "redirects to the new category" do
        post :create, params: { category: { name: "New category", details: "Details about new category" } }
        expect(response).to redirect_to(Category.last)
      end
    end

    context "with invalid attributes" do
      it "does not save the new category" do
        expect {
          post :create, params: { category: { name: "", details: "" } }
        }.to_not change(Category, :count)
      end

      it "re-renders the new method" do
        post :create, params: { category: { name: "", details: "" } }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    it "updates the category" do
      put :update, params: { id: category.id, category: { name: "Updated category", details: "Updated details" } }
      category.reload
      expect(category.name).to eq("Updated category")
      expect(category.details).to eq("Updated details")
    end
  end

  describe 'DELETE #destroy' do
    it "deletes the category" do
      category.tasks.each do |task|
        task.destroy
      end
      expect {
        delete :destroy, params: { id: category.id }
      }.to change(Category, :count).by(-1)
    end
  
    it "redirects to categories#index" do
      category.tasks.each do |task|
        task.destroy
      end
      delete :destroy, params: { id: category.id }
      expect(response).to redirect_to categories_url
    end
  end
  
end
