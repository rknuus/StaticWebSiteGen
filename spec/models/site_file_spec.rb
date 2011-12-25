require 'spec_helper'

describe SiteFile do
  it "should be invalid without name or path" do
    SiteFile.new.valid?.should eq(false)
  end

  it "name should be unique" do
    SiteFile.create(:name => 'unique', :path => '/foo/bar')
    SiteFile.new(:name => 'unique', :path => '/foo/baz').valid?.should eq(false)
  end
  
  #FIXME: name should be unique only for a single site, but not globally unique
end
