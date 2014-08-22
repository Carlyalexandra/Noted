module UsersHelper

	def video_view(video)
		content_tag :li do
			content_tag :p do
				image_tag video[:thumbnail], class: "thumbnail", id: video[:id], data: {id: video[:id], title: video[:title]} 
			end
		end
	end
end
