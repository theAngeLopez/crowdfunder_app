class ProjectsController < ApplicationController

  def index
    @projects = if params[:search]
      Project.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%").page(params[:page])
    else
      Project.all.page(params[:page])
    end

    respond_to do |format|
      format.html do
        if request.xhr?
          render @projects
        else
          render 'index'
        end
      end

      format.js { render 'index' }
    end
  end

  def show
    @project = Project.find(params[:id])
    @review = Review.new
    @rewards = @project.rewards
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

    if @project.update_attributes(project_params)
      redirect_to product_path(@project)
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
    params.require(:project).permit(:name, :description, :funding_goal, :start_date, :end_date, :category, rewards_attributes: [:id, :description, :done, :_destroy])
  end
end
