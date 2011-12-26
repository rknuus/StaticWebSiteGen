module PagesHelper
  def cancel_page_link
    page_link 'Cancel'
  end

  def close_page_link
    page_link 'Close'
  end
  
private
  def page_link(name)
    link_to name, pages_path(:site_id => @page.site_id)
  end
end
