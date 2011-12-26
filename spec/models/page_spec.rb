require 'spec_helper'

describe Page do
  it "should be invalid without name or content" do
    Page.new.valid?.should eq(false)
  end

  it "name should be unique" do
    params = { :name => 'unique', :content => 'foo', :site_id => 1 }
    Page.create(params)
    Page.new(params).valid?.should eq(false)
  end
  
  it "should allow two sites to use same name" do
    params = { :name => 'unique', :content => 'foo' }
    Page.create(params.merge({ :site_id => 1 }))
    Page.new(params.merge({ :site_id => 2 })).valid?.should eq(true)
  end
end
