require 'spec_helper'

describe "pages/show.html.erb" do
  # before(:each) do
  #   @page = assign(:page, stub_model(Page,
  #     :page_id => 1,
  #     :name => "Name",
  #     :content => "MyText",
  #     :page_texts => []
  #   ))
  # end

  it "renders a page without page texts" do
    site = mock_model(Site, :name => 'MyString', :template => 'MyText')
    @page = mock_model(Page, :name => 'MyString', :content => 'MyText',
      :page_files => nil, :page_texts => nil, :site => site, :site_id => site.id)

    render
    
    assert_select 'h1', 'MyString requires'
    assert_select 'div>label', 'Content'
    assert_select 'form>div>textarea', 'MyText'
    assert_select 'div>h2', 'Page texts:'
    assert_select 'div>a', 'New page text'
    # assert_select 'div>h2', 'Page files:'
    # assert_select 'div>a', 'New page file'
    assert_select 'a', 'Close'
  end
end
