require 'spec_helper'

describe "page_files/new.html.erb" do
  before(:each) do
    @page_file = assign(:page_file, stub_model(PageFile,
      :name => "MyString",
      :path => "MyString"
    ).as_new_record)
    @page_file.page = assign(:page, stub_model(Page,
      :name => "MyString",
      :content => "MyText"
    ))
  end

  it "renders new page_file form" do
    render

    assert_select "form", :action => page_files_path, :method => "post" do
      assert_select "input#page_file_name", :name => "page_file[name]"
      assert_select "input#page_file_path", :name => "page_file[path]"
      assert_select "input#page_file_page_id", :name => "page_file[page_id]", :type => :hidden
    end
  end
end
