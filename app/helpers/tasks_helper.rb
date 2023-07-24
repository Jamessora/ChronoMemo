# app/helpers/tasks_helper.rb
module TasksHelper
    def tasks_due_today(user)
      today = Time.zone.now.beginning_of_day..Time.zone.now.end_of_day
      user.tasks.where(date_due: today)
    end

    def tasks_not_due_today(user)
        today = Date.current
        user.tasks.where.not(date_due: today.all_day)
    end
    
    def sort_tasks(tasks)
    today = Time.zone.now.beginning_of_day

    overdue_tasks = tasks.select { |task| task.date_due < today }
    due_today_tasks = tasks.select { |task| task.date_due >= today && task.date_due <= today.end_of_day }
    not_due_today_tasks = tasks.select { |task| task.date_due > today.end_of_day }

    sorted_tasks = overdue_tasks + due_today_tasks + not_due_today_tasks
    return sorted_tasks
    end
end