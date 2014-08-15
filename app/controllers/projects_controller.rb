class ProjectsController < ApplicationController
 before_action :authenticate_user!
  
  def index
    @projects = Project.all
  end

  def new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    @project.save

    redirect_to user_projects_path(current_user)
  end


  def edit
    @project = Project.find(params[:id])
  end

def update
  @project = Project.find(params[:id])
  if @project.update(project_params)
    respond_to do |format|
      format.html {redirect_to (current_user), notice: "Project updated"}
      format.json { respond_with_bip(@project) }
    end
  else
     respond_to do |format|
      format.html {render :edit}
      format.json { respond_with_bip(@project) }
    end
  end 
end


  def show
    @project = Project.find(params[:id])
  	@notes = @project.notes.all

  end

  def destroy
    @project = Project.find(params[:id])
    @project.delete
    redirect_to user_projects_path(current_user)
  end

  private
  def project_params
    params.require(:project).permit(:title, :user_id)
  end

end