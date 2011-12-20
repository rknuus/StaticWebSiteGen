require 'spec_helper'

describe "sites/require.html.erb" do
  # before(:each) do
  #   assign(:site, stub_model(Site,
  #     :name => "MyString",
  #     :template => "MyText"
  #   ).as_new_record)
  # end

  it "renders require page" do
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
end
