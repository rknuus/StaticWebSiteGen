module SitesHelper
  def cancel_link
    link_to 'Cancel', sites_path
  end

  def close_link
    link_to 'Close', sites_path
  end
end
