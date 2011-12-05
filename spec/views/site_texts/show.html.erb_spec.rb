require 'spec_helper'

describe "site_texts/show.html.erb" do
  before(:each) do
    @site_text = assign(:site_text, stub_model(SiteText,
      :site_id => 1,
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
