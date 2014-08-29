class NotesController < ApplicationController
  require 'prawn'


  before_action :authenticate_user!
  
  def index
    @notes = current_user.notes.all
  end

  def show
    q = params[:q].to_s
    @q = q
    @note = Note.find(params[:id])
  end

  def new
  	@note = Note.new
  end

  def create
  	@note = Note.new(note_params)
    @note.user = current_user
  	if @note.save
  		respond_to do |format|
  			format.html {redirect_to user_note_path(current_user,@note.id), notice: "New note Created"}
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
        respond_to do |format|
          unless current_user.notes.count < 1
  			     format.html {redirect_to user_notes_path(current_user), notice: "note deleted"}
  			     format.js {head :no_content}
          else
             format.html {redirect_to search_path, notice: "note deleted"}
             format.js {head :no_content}
          end   
  		end
   end	


  def save_as_pdf
    @note = Note.find(params[:id])
    @note.pdf(current_user)
    #redirects to the PDF in the public folder
    @title = @note.title.to_s
    redirect_to "/#{URI.escape(@title)}.pdf"      
  end
  
  def edit
  	@note = Note.find(params[:id])
  end


 def update
	@note = Note.find(params[:id])
	if @note.update(note_params)
    # if @note.body.blank?
    #   @note.update body: nil
    # end
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
  	params.require(:note).permit(:user_id, :body, :title, :video_url, :thumbnail)
  end

  # def set_project
  # 	@project = Project.find(params[:project_id])
  # end

end