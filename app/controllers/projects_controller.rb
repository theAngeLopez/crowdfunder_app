class ProjectsController < ApplicationController

  def index
    @projects = Project.order(end_date: :desc)
  end

  def show
    @project = Project.find(params[:id])
    @review = Review.new
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
      if @project.save
        redirect_to projects_path, notice: "New Project Created!"
      else
        render "new"
      end
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :funding_goal, :start_date, :end_date)
  end
end
