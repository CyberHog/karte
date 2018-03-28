module ApplicationHelper
	def page_title
		title = "カルテ"
		title = @page_title + " - " + title if @page_title
		title
	end

	def user_image_tag(user, options = {})
		if user.image.present?
			path = member_path(user, format: user.image.extension)
			link_to(image_tag(path, { alt: user.full_name }.merge(options)), path)
		else
			""
		end
	end
end
