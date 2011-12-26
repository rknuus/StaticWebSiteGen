require 'spec_helper'

describe "pages/index.html.erb" do
  before(:each) do
    assign(:pages, [
      stub_model(Page,
        :name => "Name",
        :content => "MyText"
      ),
      stub_model(Page,
        :name => "Name",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of pages" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "a", :text => 'New Page'
    assert_select "a", :text => 'Sites'
  end
end
