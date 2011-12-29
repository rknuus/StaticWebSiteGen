require 'spec_helper'

describe "pages/index.html.erb" do
  before(:each) do
    @pages = assign(:pages, [
      stub_model(Page,
        :name => "Name",
        :content => "MyText"
      ),
      stub_model(Page,
        :name => "Name",
        :content => "MyText"
      )
    ])
    @site = assign(:site, stub_model(Site,
      :name => "MyString",
      :template => "MyText"
    ))
    @pages.each do |page|
      page.site = @site
    end
    assign(:site_id, @site.id)
  end

  it "renders a list of pages" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select 'tr>td>a', :text => 'Edit page', :count => 2
    assert_select 'tr>td>a', :text => 'Edit locals', :count => 2
    assert_select 'tr>td>a', :text => 'Destroy', :count => 2
    assert_select "a", :text => 'New page'
    assert_select "a", :text => 'Sites'
  end
end
