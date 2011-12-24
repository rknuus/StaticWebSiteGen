module SiteTextsHelper
  def cancel_site_text_link
    link_to 'Cancel', site_path(@site_text.site)
  end

  def close_site_text_link
    link_to 'Close', site_path(@site_text.site)
  end
end
