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
      :page_files => nil, :page_texts => nil, :site_id => site.id)

    render
    
    assert_select 'h1', 'MyString requires'
    assert_select 'div>label', 'Content'
    assert_select 'form>div>textarea', 'MyText'
    assert_select 'div>h2', 'Page texts:'
    assert_select 'div>a', 'New page text'
    assert_select 'div>h2', 'Page files:'
    assert_select 'div>a', 'New page file'
    assert_select 'a', 'Close'
  end

  it "renders a page with two page texts" do
    site = mock_model(Site, :name => 'MyString', :template => 'MyText')
    @page = mock_model(Page, :name => 'MyString', :content => 'MyText',
     :page_files => nil, :page_texts => [
       mock_model(PageText, :name => 't1', :content => 'text 1'),
       mock_model(PageText, :name => 't2', :content => 'text 2')
     ], :site_id => site.id
    )
  
    render
    
    assert_select 'div>table>tr>th', 'Name'
    assert_select 'div>table>tr>th', 'Content'
    assert_select 'div>table>tr>td', 't1'
    assert_select 'div>table>tr>td', 'text 1'
    assert_select 'div>table>tr>td', 't2'
    assert_select 'div>table>tr>td', 'text 2'
  end
  
  it "renders a page with a truncated page text" do
    site = mock_model(Site, :name => 'MyString', :template => 'MyText')
    @page = mock_model(Page, :name => 'MyString', :content => 'MyText',
     :page_files => nil, :page_texts => [
       mock_model(PageText, :name => 't1', :content => 'x' * 51)
     ], :site_id => site.id
    )
  
    render
    
    assert_select 'div>table>tr>td', /\.{3}$/
  end
  
  it "renders a page with two page files" do
    site = mock_model(Site, :name => 'MyString', :template => 'MyText')
    @page = mock_model(Page, :name => 'MyString', :content => 'MyText',
     :page_texts => nil, :page_files => [
       mock_model(PageFile, :name => 'f1', :path => '/foo/bar'),
       mock_model(PageFile, :name => 'f2', :path => '/foo/baz')
     ], :site_id => site.id
    )
  
    render
    
    assert_select 'div>table>tr>th', 'Name'
    assert_select 'div>table>tr>th', 'Path'
    assert_select 'div>table>tr>td', 'f1'
    assert_select 'div>table>tr>td', '/foo/bar'
    assert_select 'div>table>tr>td', 'f2'
    assert_select 'div>table>tr>td', '/foo/baz'
  end
end
