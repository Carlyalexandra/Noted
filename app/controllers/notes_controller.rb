class NotesController < ApplicationController
  def show
    @note = Note.find(params[:id])
    @project = Project.find(params[:project_id])
  end

  def new
  	@note = Note.new
  end

  def create
  	@note = Note.new(note_params)
  	@note.body = "Something brilliant here..."
  	@note.project = Project.find(params[:project_id])

  	if @note.save
  		respond_to do |format|
  			format.html {redirect_to (current_user), notice: "New note Created"}
  			format.js {}
  		end
  	else
  		respond_to do |format|
  			format.html {render :new}
  			format.js 
  		end
  	end
 end

  def destroy
	@note = Note.find(params[:id])
	@note.destroy
	@project = Project.find(params[:project_id])
        respond_to do |format|
  			format.html {redirect_to (current_user), notice: "note deleted"}
  			format.js {head :no_content}
  		end
   end	

  def edit
  	@note = Note.find(params[:id])
  end


 def update
	@note = Note.find(params[:id])
	if @note.update(note_params)
		respond_to do |format|
			format.html {redirect_to (current_user), notice: "note updated"}
			format.json { respond_with_bip(@note) }
		end
	else
	   respond_to do |format|
			format.html {render :edit}
			format.json { respond_with_bip(@note) }
		end
	end 
end

  private
  def note_params
  	params.require(:note).permit(:project_id, :body, :title, :video_url)
  end

  def set_project
  	@project = Project.find(params[:project_id])
  end

end