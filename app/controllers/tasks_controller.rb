class TasksController < ApplicationController

    before_action :set_task, only: [:show, :edit, :update, :destroy]
  
    # GET /tasks
    def index
        @tasks = current_user.tasks
    end
  
    # GET /tasks/1
    def show
    end
  
    # GET /tasks/new
    def new
        if Category.count.zero?
            flash[:alert] = 'Please add a category first before creating a task'
            redirect_to new_category_path
            else
            @task = Task.new
        end
    end
  
    # GET /tasks/1/edit
    def edit
    end
  
    # POST /tasks
    def create
    @task = Task.new(task_params)
    @task.user = current_user # Assign the task to the current logged-in user
  
        if @task.save
            redirect_to @task, notice: 'Task was successfully created.'
            
         else
            flash.now[:alert] = 'Task could not be created due to the following errors:'
            render :new
        end
    
    end
  
    # PATCH/PUT /tasks/1
    def update
      if @task.update(task_params)
        redirect_to @task, notice: 'Task was successfully updated.'
      else
        render :edit
      end
    end
  
    # DELETE /tasks/1
    def destroy
      @task.destroy
      redirect_to tasks_url, notice: 'Task was successfully destroyed.'
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :details, :date_due, :category_id)
    end
  
  



end
