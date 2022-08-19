class TasksController < ApplicationController
    def index
        @tasks = Task.all
        @task = Task.new
      end
      
      def toggle
        @task = Task.find(params[:id])
        @task.update(completed: params[:completed])
      
        render json: { message: "Success" }
      end

    def create
        @task = Task.new(task_params)

        respond_to do |format|
            if @task.save
             format.html {redirect_to tasks_url, notice: "You have successfully created a task"}
            else
                format.html {render :new, status: "unprocessible_entity"}

    end
 end
end

private

def task_params
    params.require(:task).permit(:description)
 end
end