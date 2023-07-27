class PagesController < ApplicationController
  include TasksHelper

  def home
 
    @tasks_due_today = tasks_due_today(current_user)
    today = Time.zone.now.beginning_of_day 
    @tasks_not_due_today = Task.where.not(date_due: today.all_day)
    @overdue_tasks = Task.where("date_due < ?", today)
    @tasks = (@overdue_tasks + @tasks_due_today + @tasks_not_due_today).sort_by(&:date_due)


    if params[:category_id]
      @category = Category.find(params[:category_id])
      @tasks = @category.tasks.where(user_id: current_user.id)
    else
      @tasks = Task.where(user_id: current_user.id)
    end
    @categories = Category.where(user_id: current_user.id)
  end
end
