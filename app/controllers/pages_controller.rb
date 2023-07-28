class PagesController < ApplicationController
  include TasksHelper

  def home
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @tasks = @category.tasks.where(user_id: current_user.id).order(completed: :asc, date_due: :asc)
    else
      @tasks = Task.where(user_id: current_user.id).order(completed: :asc, date_due: :asc)
    end
  
    @categories = Category.where(user_id: current_user.id)
  end
end
