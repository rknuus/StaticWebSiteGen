require 'spec_helper'

describe "page_texts/show.html.erb" do
  before(:each) do
    @page_text = assign(:page_text, stub_model(PageText,
      :name => "Name",
      :content => "MyText"
    ))
    @page_text.page = assign(:page, stub_model(Page,
      :name => "MyString",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render

    rendered.should match(/Name/)
    rendered.should match(/MyText/)
  end
end
