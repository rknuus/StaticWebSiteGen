require 'spec_helper'

describe "site_files/show.html.erb" do
  before(:each) do
    @site_file = assign(:site_file, stub_model(SiteFile,
      :name => "Name",
      :path => "Path"
    ))
    @site_file.site = assign(:site, stub_model(Site,
      :name => "MyString",
      :template => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render

    rendered.should match(/Name/)
    rendered.should match(/Path/)
  end
end
