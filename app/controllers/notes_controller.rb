class NotesController < ApplicationController
  require 'prawn'

  before_action :authenticate_user!
  
  def index
    @notes = current_user.notes.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
  	@note = Note.new
  end

  def create
  	@note = Note.new(note_params)
    @note.user = current_user
  	@note.body = "Something brilliant here..."
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
  			format.html {redirect_to user_notes_path(current_user), notice: "note deleted"}
  			format.js {head :no_content}
  		end
   end	

   def save_as_pdf
    @note = Note.find(params[:id])
      ### Generates the PDF to be sent to Lob API for print
            Prawn::Document.generate("public/'#{@note.title}'.pdf") do |pdf|
            # pdf.image "public/card_templates/#{@card_templates.find_by(id: @card.card_template_id).template_path}", :position => :center, :width => 738, :height => 522
            # pdf.start_new_page
              pdf.text "#{@note.title}"
              pdf.text "#{@note.video_url}"
              pdf.text_box "#{@note.body}",
              :overflow => :shrink_to_fit,
              :min_font_size => 10,
              :disable_wrap_by_char => true
              
            end 
            redirect_to user_note_path(current_user, @note.id)         
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
  	params.require(:note).permit(:user_id, :body, :title, :video_url)
  end

  # def set_project
  # 	@project = Project.find(params[:project_id])
  # end

end