class ProjectsController < ApplicationController

  def create
    Project.create(project_params)
    redirect_to '/projects'
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = 'Project successfully deleted'
    redirect_to '/projects'
  end

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:name, :company)
  end

end
