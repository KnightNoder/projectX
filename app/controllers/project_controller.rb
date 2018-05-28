class ProjectController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]
	# before_action :authenticate_user!

	def index
		@projects = Project.where(user_id: current_user)
	end

	def show
	end

	def new
		@project = current_user.projects.build
	end

	def create
		@project = current_user.projects.build(project_params)

		if @project.save
			redirect_to @project
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @project.update(project_params)
			redirect_to @project
		else
			render 'edit'
		end
	end

	def destroy
		@project.destroy
		redirect_to projects_path
	end

	private

	def find_project
		@project = Project.find(params[:id])
	end

	def project_params
		params.require(:project).permit(:name)
	end
end
