require 'spec_helper'

describe "sites/new.html.erb" do
  before(:each) do
    assign(:site, stub_model(Site,
      :name => "MyString",
      :template => "MyText"
    ).as_new_record)
  end

  it "renders new site form" do
    render

    rendered.should have_selector("form", :action => sites_path, :method => "post") do |form|
      form.should have_selector("input#site_name", :name => "site[name]")
      form.should have_selector("textarea#site_template", :name => "site[template]")
    end
  end
end
