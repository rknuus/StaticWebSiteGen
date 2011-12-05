require 'spec_helper'

describe "sites/require.html.erb" do
  before(:each) do
    assign(:site, stub_model(Site,
      :name => "MyString",
      :template => "MyText"
    ).as_new_record)
  end

  include Capybara::DSL  #FIXME: why this is not done automatically?

  it "renders require site form" do
    render
    
    rendered.should have_content('MyString requires')
    rendered.should have_content('MyText')
    rendered.should have_content('Site texts:')
    rendered.should have_button('New site text')
    # rendered.should have_content('Site files:')
    # rendered.should have_button('New site file')
    # rendered.should have_button('Close')
  end
end
