require 'spec_helper'

describe "site_texts/show.html.erb" do
  before(:each) do
    @site_text = assign(:site_text, stub_model(SiteText,
      :name => 'AName',
      :content => 'MyText'
    ))
    @site_text.site = assign(:site, stub_model(Site,
      :name => "MyString",
      :template => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/AName/)
    rendered.should match(/MyText/)
  end
end