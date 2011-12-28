module SitesHelper
  def cancel_link
    link_to 'Cancel', sites_path
  end

  def close_link
    link_to 'Close', sites_path
  end

  def generate_link(site)
    link_to 'Generate', generate_site_path(site), method: :get
  end
  
  def pages_link(site_id)
    link_to 'Pages', pages_path(:site_id => site_id), method: :get
  end
end
