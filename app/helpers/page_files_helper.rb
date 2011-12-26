module PageFilesHelper
  def cancel_page_text_link
    page_text_link 'Cancel'
  end

  def close_page_text_link
    page_text_link 'Close'
  end

private
  def page_text_link(name)
    link_to name, page_path(@page_text.page_id)
  end
end
