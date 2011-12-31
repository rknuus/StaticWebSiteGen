require 'spec_helper'

describe "sites/show.html.erb" do
  # before(:each) do
  #   assign(:site, stub_model(Site,
  #     :name => "MyString",
  #     :template => "MyText"
  #   ).as_new_record)
  # end

  it "renders a site without site texts" do
    @site = mock_model(Site, :name => 'MyString', :template => 'MyText',
      :site_files => nil, :site_texts => nil)

    render
    
    assert_select 'h1', 'MyString requires'
    assert_select 'div>label', 'Template'
    assert_select 'form>div>textarea', 'MyText'
    assert_select 'div>h2', 'Site texts:'
    assert_select 'div>a', 'New site text'
    assert_select 'div>h2', 'Site files:'
    assert_select 'div>a', 'New site file'
    assert_select 'a', 'Close'
  end

  it "renders a site with two site texts" do
    @site = mock_model(Site, :name => 'MyString', :template => 'MyText',
     :site_files => nil, :site_texts => [
       mock_model(SiteText, :name => 't1', :content => 'text 1'),
       mock_model(SiteText, :name => 't2', :content => 'text 2')
     ]
    )

    render
    
    assert_select 'div>table>tr>th', 'Name'
    assert_select 'div>table>tr>th', 'Content'
    assert_select 'div>table>tr>td', 't1'
    assert_select 'div>table>tr>td', 'text 1'
    assert_select 'div>table>tr>td', 't2'
    assert_select 'div>table>tr>td', 'text 2'
  end

  it "renders a site with a truncated site text" do
    @site = mock_model(Site, :name => 'MyString', :template => 'MyText',
     :site_files => nil, :site_texts => [
       mock_model(SiteText, :name => 't1', :content => 'x' * 51)
     ]
    )

    render
    
    assert_select 'div>table>tr>td', /\.{3}$/
  end

  it "renders a site with two site files" do
    @site = mock_model(Site, :name => 'MyString', :template => 'MyText',
     :site_texts => nil, :site_files => [
       mock_model(SiteFile, :name => 'f1', :path => 'files/bar', :source_path => '/foo/bar'),
       mock_model(SiteFile, :name => 'f2', :path => 'files/baz', :source_path => '/foo/baz')
     ]
    )

    render
    
    assert_select 'div>table>tr>th', 'Name'
    assert_select 'div>table>tr>th', 'Path'
    assert_select 'div>table>tr>td', 'f1'
    assert_select 'div>table>tr>td', 'files/bar'
    assert_select 'div>table>tr>td', '/foo/bar'
    assert_select 'div>table>tr>td', 'f2'
    assert_select 'div>table>tr>td', 'files/baz'
    assert_select 'div>table>tr>td', '/foo/baz'
  end
end
