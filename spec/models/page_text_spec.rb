require 'spec_helper'

describe PageText do
  it "should be invalid without content" do
    PageText.new.valid?.should eq(false)
  end

  # it "name should be unique" do
  #   params = { :name => 'unique', :content => 'content', :site_id => 1 }
  #   PageText.create(params)
  #   PageText.new(params).valid?.should eq(false)
  # end
  # 
  # it "should allow two sites to use same name" do
  #   params = { :name => 'unique', :content => 'content' }
  #   PageText.create(params.merge({ :site_id => 1 }))
  #   PageText.new(params.merge({ :site_id => 2 })).valid?.should eq(true)
  # end
end
