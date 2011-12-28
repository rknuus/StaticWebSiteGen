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
end
