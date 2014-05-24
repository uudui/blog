module ApplicationHelper
  def time_ago_tag(time)
    time_tag time, data: { behaviors: 'timeago' }
  end

  def page_title
    @page_title ? "#{@page_title} - #{CONFIG['title']}" : CONFIG['title']
  end
end
