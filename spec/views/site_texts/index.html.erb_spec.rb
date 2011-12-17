require 'spec_helper'

describe "site_texts/index.html.erb" do
  before(:each) do
    assign(:site_texts, [
      stub_model(SiteText,
        :site_id => 1,
        :content => "MyText"
      ),
      stub_model(SiteText,
        :site_id => 1,
        :content => "MyText"
      )
    ])
  end

  it "renders a list of site_texts" do
    render

    #FIXME: why does the webrat style result in a mismatch?
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # rendered.should have_selector("tr>td", :text => 1.to_s, :count => 2)
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # rendered.should have_selector("tr>td", :text => "MyText".to_s, :count => 2)
  end
end
