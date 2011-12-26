require 'spec_helper'

describe "page_files/new.html.erb" do
  before(:each) do
    assign(:page_file, stub_model(PageFile,
      :page_id => 1,
      :name => "MyString",
      :path => "MyString"
    ).as_new_record)
  end

  it "renders new page_file form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => page_files_path, :method => "post" do
      assert_select "input#page_file_page_id", :name => "page_file[page_id]"
      assert_select "input#page_file_name", :name => "page_file[name]"
      assert_select "input#page_file_path", :name => "page_file[path]"
    end
  end
end
