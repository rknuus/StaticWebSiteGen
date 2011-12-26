module SiteFilesHelper
  def cancel_site_file_link
    site_file_link 'Cancel'
  end

  def close_site_file_link
    site_file_link 'Close'
  end

private
  def site_file_link(name)
    link_to name, site_path(@site_file.site_id)
  end
end
