module ApplicationHelper
	def page_title
		title = "カルテ"
		title = @page_title + " - " + title if @page_title
		title
	end

	def simple_time(time)
		time.strftime("%Y年%m月%d日 %H:%M ")
	end
end
