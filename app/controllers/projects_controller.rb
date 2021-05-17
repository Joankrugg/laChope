class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]
  def index
    @projects = Project.all
  end

  def new
    @user = current_user
    @project = Project.new
  end

  def create
    @user = current_user
    @project = @user.projects.new(project_params)
    @project.user = @user
    if
      @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def show

  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :pack_id, :sticker_id, :bottle_top_id, :typical_beer_id)
  end
end

