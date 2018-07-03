module ApplicationHelper

  def full_title(page_title)
    base_title = "karte"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def simple_time(datetime)
	datetime.strftime("%Y/%m/%d")
  end
end
