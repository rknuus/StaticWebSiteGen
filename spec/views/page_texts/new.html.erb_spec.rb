require 'spec_helper'

describe "page_texts/new.html.erb" do
  before(:each) do
    @page_text = assign(:page_text, stub_model(PageText,
      :name => "MyString",
      :content => "MyText"
    ).as_new_record)
    @page_text.page = assign(:page, stub_model(Page,
      :name => "MyString",
      :content => "MyText"
    ))
  end

  it "renders new page_text form" do
    render

    assert_select "form", :action => page_texts_path, :method => "post" do
      assert_select "input#page_text_name", :name => "page_text[name]"
      assert_select "textarea#page_text_content", :name => "page_text[content]"
      assert_select "input#page_text_page_id", :name => "page_text[page_id]", :type => :hidden
    end
  end
end
