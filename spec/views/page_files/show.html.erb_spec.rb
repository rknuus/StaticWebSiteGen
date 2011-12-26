require 'spec_helper'

describe "page_files/show.html.erb" do
  before(:each) do
    @page_file = assign(:page_file, stub_model(PageFile,
      :name => "Name",
      :path => "Path"
    ))
    @page_file.page = assign(:page, stub_model(Page,
      :name => "MyString",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render

    rendered.should match(/Name/)
    rendered.should match(/Path/)
  end
end
