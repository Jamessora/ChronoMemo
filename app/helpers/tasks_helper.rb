# app/helpers/tasks_helper.rb
module TasksHelper
  
  def tasks_due_today(user)
    today = Time.zone.now.beginning_of_day..Time.zone.now.end_of_day
    user.tasks.where(date_due: today).order(completed: :asc, date_due: :asc)
  end

  def tasks_not_due_today(user)
    today = Date.current
    user.tasks.where.not(date_due: today.all_day).order(completed: :asc, date_due: :asc)
  end

  def task_errors(task)
    task.errors.full_messages.join(', ')
  end


end