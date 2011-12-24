require 'spec_helper'

describe "sites/show.html.erb" do
  # before(:each) do
  #   assign(:site, stub_model(Site,
  #     :name => "MyString",
  #     :template => "MyText"
  #   ).as_new_record)
  # end

  it "renders a site without site texts" do
    @site = mock_model(Site, :name => 'MyString', :template => 'MyText', :site_texts => nil)

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
     :site_texts => [
       mock_model(SiteText, :name => 't1', :content => 'text 1'),
       mock_model(SiteText, :name => 't2', :content => 'text 2')
     ]
    )

    render
    
    assert_select 'div>table>tr>td', 't1'
    assert_select 'div>table>tr>td', 'text 1'
    assert_select 'div>table>tr>td', 't2'
    assert_select 'div>table>tr>td', 'text 2'
  end
end
