module SiteTextsHelper
  def cancel_site_text_link
    site_text_link 'Cancel'
  end

  def close_site_text_link
    site_text_link 'Close'
  end
  
private
  def site_text_link(name)
    link_to name, site_path(@site_text.site_id)
  end
end
