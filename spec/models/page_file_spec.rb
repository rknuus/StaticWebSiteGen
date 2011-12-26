require 'spec_helper'

describe PageFile do
  it "should be invalid without name or path" do
    PageFile.new.valid?.should eq(false)
  end

  it "name should be unique" do
    params = { :name => 'unique', :path => '/foo/bar', :page_id => 1 }
    PageFile.create(params)
    PageFile.new(params).valid?.should eq(false)
  end
  
  it "should allow two pages to use same name" do
    params = { :name => 'unique', :path => '/foo/bar' }
    PageFile.create(params.merge({ :page_id => 1 }))
    PageFile.new(params.merge({ :page_id => 2 })).valid?.should eq(true)
  end
end
