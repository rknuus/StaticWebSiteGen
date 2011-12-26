require 'spec_helper'

describe "page_files/edit.html.erb" do
  before(:each) do
    @page_file = assign(:page_file, stub_model(PageFile,
      :name => "MyString",
      :path => "MyString"
    ))
  end

  it "renders the edit page_file form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => page_files_path(@page_file), :method => "post" do
      assert_select "input#page_file_page_id", :name => "page_file[page_id]"
      assert_select "input#page_file_name", :name => "page_file[name]"
      assert_select "input#page_file_path", :name => "page_file[path]"
    end
  end
end
