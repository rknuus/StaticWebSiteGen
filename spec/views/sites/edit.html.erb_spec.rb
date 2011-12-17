require 'spec_helper'

describe "sites/edit.html.erb" do
  before(:each) do
    @site = assign(:site, stub_model(Site,
      :name => "MyString",
      :template => "MyText"
    ))
  end

  it "renders the edit site form" do
    render

    # rendered.should have_selector("form", :action => site_path(@site), :method => "post") do |form|
    #   form.should have_selector("input#site_name", :name => "site[name]")
    #   form.should have_selector("textarea#site_template", :name => "site[template]")

    assert_select "form", :action => sites_path(@site), :method => "post" do
      assert_select "input#site_name", :name => "site[name]"
      assert_select "textarea#site_template", :name => "site[template]"
    end
  end
end
