require 'spec_helper'

describe "pages/new.html.erb" do
  before(:each) do
    @page = assign(:page, stub_model(Page,
      :name => "MyString",
      :content => "MyText"
    ).as_new_record)
    @page.site = assign(:site, stub_model(Site,
      :name => "MyString",
      :template => "MyText"
    ))
  end

  it "renders new page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pages_path, :method => "post" do
      assert_select "input#page_site_id", :name => "page[site_id]"
      assert_select "input#page_name", :name => "page[name]"
      assert_select "textarea#page_content", :name => "page[content]"
    end
  end
end
