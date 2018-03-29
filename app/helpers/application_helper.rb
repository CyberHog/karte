module ApplicationHelper
	def page_title
		title = "カルテ"
		title = @page_title + " - " + title if @page_title
		title
	end
end
