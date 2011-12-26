require 'spec_helper'

describe "page_files/show.html.erb" do
  before(:each) do
    @page_file = assign(:page_file, stub_model(PageFile,
      :page_id => 1,
      :name => "Name",
      :path => "Path"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Path/)
  end
end
