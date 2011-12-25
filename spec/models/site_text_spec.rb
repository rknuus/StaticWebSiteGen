require 'spec_helper'

describe SiteText do
  it "should be invalid without content" do
    SiteText.new.valid?.should eq(false)
  end

  it "name should be unique" do
    params = { :name => 'unique', :content => 'content', :site_id => 1 }
    SiteText.create(params)
    SiteText.new(params).valid?.should eq(false)
  end
  
  it "should allow two sites to use same name" do
    params = { :name => 'unique', :content => 'content' }
    SiteText.create(params.merge({ :site_id => 1 }))
    SiteText.new(params.merge({ :site_id => 2 })).valid?.should eq(true)
  end
end
