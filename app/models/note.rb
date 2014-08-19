class Note < ActiveRecord::Base
	belongs_to :user
	
	def pdf(user)
	    Prawn::Document.generate("public/#{self.title}.pdf") do |pdf|
	      pdf.stroke_horizontal_rule
	      pdf.pad(20) { pdf.text "#{self.title}",  :align => :center, :style => :bold, :size => 14 }
	      pdf.stroke_horizontal_rule
	      pdf.move_down(20)
	      pdf.formatted_text [ { :text => "https://www.youtube.com/watch?v=#{self.video_url}", :link => "https://www.youtube.com/watch?v=#{self.video_url}", :color => "0000FF" }] 
	      pdf.move_down(20)
	      pdf.text "Notes by #{user.fname} #{user.lname}:", :style => :bold
	      pdf.move_down(7)
	      pdf.text "#{self.body}",
	      :overflow => :shrink_to_fit,
	      :min_font_size => 10,
	      :disable_wrap_by_char => true  
	    end      
	end

end
