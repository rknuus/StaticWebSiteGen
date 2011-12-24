require 'spec_helper'

describe SiteText do
  it "should be invalid without content" do
    SiteText.new.valid?.should eq(false)
  end

  it "name should be unique" do
    SiteText.create(:name => 'unique', :content => 'content')
    SiteText.new(:name => 'unique', :content => 'content').valid?.should eq(false)
  end
end
