require 'spec_helper'

describe "site_texts/edit.html.erb" do
  before(:each) do
    @site_text = assign(:site_text, stub_model(SiteText,
      :site_id => 1,
      :content => "MyText"
    ))
    @site_text.site = assign(:site, stub_model(Site,
      :name => "MyString",
      :template => "MyText"
    ))
  end

  it "renders the edit site_text form" do
    render
    
    assert_select "form", :action => site_texts_path(@site_text), :method => "post" do
      assert_select "input#site_text_site_id", :name => "site_text[site_id]"
      assert_select "textarea#site_text_content", :name => "site_text[content]"
    end
  end
end
