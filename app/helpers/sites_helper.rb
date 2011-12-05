module SitesHelper
  def cancel_button
    button_to 'Cancel', sites_path, method: :get
  end

  def close_button
    button_to 'Close', sites_path, method: :get
  end
end
