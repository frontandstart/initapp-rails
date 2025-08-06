class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]
  
  def index
    @projects = Project.published.ordered.includes(:photos)
  end

  def show
    redirect_to portfolio_path unless @project&.published?
  end
  
  private
  
  def set_project
    @project = Project.find_by(slug: params[:id])
  end
end
