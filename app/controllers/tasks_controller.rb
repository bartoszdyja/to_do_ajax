class TasksController < ApplicationController
	def new
		@task = Task.new
	end

	def create
		@task = Task.new(task_params)
		if @task.save
			redirect_to root_path
		end
	end

	def index
		@tasks_undone= Task.where(done: false).order('created_at ASC')
		@tasks_done= Task.where(done: true)
	end

	def update
		@task = Task.find(params[:id])
		if @task.update(task_params)
			redirect_to root_path
		end
	end

	def show
		@task = Task.find(params[:id])
	end

	def destroy
		if Task.find(params[:id]).destroy
			redirect_to root_path
		end
	end

	private
	def task_params
		params.require(:task).permit(:description, :done)
	end
end
