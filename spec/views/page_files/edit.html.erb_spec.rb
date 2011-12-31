require 'spec_helper'

describe "page_files/edit.html.erb" do
  before(:each) do
    @page_file = assign(:page_file, stub_model(PageFile,
      :name => "MyString",
      :path => "MyString"
    ))
    @page_file.page = assign(:page, stub_model(Page,
      :name => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit page_file form" do
    render

    assert_select "form", :action => page_files_path(@page_file), :method => "post" do
      assert_select "input#page_file_name", :name => "page_file[name]"
      assert_select "input#page_file_path", :name => "page_file[path]"
      assert_select "input#page_file_source_path", :name => "page_file[source_path]"
      assert_select "input#page_file_page_id", :name => "page_file[page_id]", :type => :hidden
    end
  end
end
