module SiteFilesHelper
  def cancel_site_file_link
    link_to 'Cancel', site_path(@site_file.site)
  end

  def close_site_file_link
    link_to 'Close', site_path(@site_file.site)
  end
end
