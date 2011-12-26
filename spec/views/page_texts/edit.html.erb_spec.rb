require 'spec_helper'

describe "page_texts/edit.html.erb" do
  before(:each) do
    @page_text = assign(:page_text, stub_model(PageText,
      :site_id => 1,
      :name => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit page_text form" do
    render

    assert_select "form", :action => page_texts_path(@page_text), :method => "post" do
      assert_select "input#page_text_name", :name => "page_text[name]"
      assert_select "textarea#page_text_content", :name => "page_text[content]"
      assert_select "input#page_text_page_id", :name => "page_text[page_id]", :type => :hidden
    end
  end
end
