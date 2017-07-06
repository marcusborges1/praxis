class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: "Projeto criado com sucesso."
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Projeto atualizado com sucesso."
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: "Projeto foi excluído com sucesso."
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name)
    end
end
