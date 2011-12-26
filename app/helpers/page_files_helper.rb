module PageFilesHelper
  def cancel_page_file_link
    page_file_link 'Cancel'
  end

  def close_page_file_link
    page_file_link 'Close'
  end

private
  def page_file_link(name)
    link_to name, page_path(@page_file.page_id)
  end
end
