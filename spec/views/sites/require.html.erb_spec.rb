require 'spec_helper'

describe "sites/require.html.erb" do
  # before(:each) do
  #   assign(:site, stub_model(Site,
  #     :name => "MyString",
  #     :template => "MyText"
  #   ).as_new_record)
  # end

  include Capybara::DSL  #FIXME: why this is not done automatically?

  it "renders require page" do
    @site = mock_model(Site, :name => 'MyString', :template => 'MyText')

    render
    
    rendered.should have_content('MyString requires')
    rendered.should have_content('MyText')
    rendered.should have_content('Site texts:')
    rendered.should have_link('New site text')
    rendered.should have_content('Site files:')
    rendered.should have_link('New site file')
    rendered.should have_link('Close')
  end
end
