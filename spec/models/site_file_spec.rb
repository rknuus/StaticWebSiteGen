require 'spec_helper'

describe SiteFile do
  it "should be invalid without name or path" do
    SiteFile.new.valid?.should eq(false)
  end

  it "name should be unique" do
    params = { :name => 'unique', :path => '/foo/bar', :site_id => 1 }
    SiteFile.create(params)
    SiteFile.new(params).valid?.should eq(false)
  end
  
  it "should allow two sites to use same name" do
    params = { :name => 'unique', :path => '/foo/bar' }
    SiteFile.create(params.merge({ :site_id => 1 }))
    SiteFile.new(params.merge({ :site_id => 2 })).valid?.should eq(true)
  end
end
