module SitesHelper
  def cancel_button
    button_to 'Cancel', sites_path, method: :get
  end
end
