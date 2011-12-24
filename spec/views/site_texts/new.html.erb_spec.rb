require 'spec_helper'

describe "site_texts/new.html.erb" do
  before(:each) do
    assign(:site_text, stub_model(SiteText,
      :site_id => 1,
      :content => "MyText",
      :name => 'MyName'
    ).as_new_record)
  end

  it "renders new site_text form" do
    render

    assert_select "form", :action => site_texts_path, :method => "post" do
      assert_select "input#site_text_name", :name => "site_text[name]"
      assert_select "textarea#site_text_content", :name => "site_text[content]"
      assert_select "input#site_text_site_id", :name => "site_text[site_id]", :type => :hidden
    end
  end
end
