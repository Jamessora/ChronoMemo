class PagesController < ApplicationController
  include TasksHelper

  skip_before_action :authenticate_user!, only: [:landing]

  # GET  /       ← public splash
  def landing
    # nothing needed here—just renders views/pages/landing.html.erb
  end


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
