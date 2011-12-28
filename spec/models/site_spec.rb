require 'spec_helper'

describe Site do
  it "should be invalid without name or template" do
    Site.new.valid?.should eq(false)
  end

  it "name should be unique" do
    params = { :name => 'unique', :template => 'foo' }
    Site.create(params)
    Site.new(params).valid?.should eq(false)
  end
  
  it "should provide access to texts" do
    params = { :name => 'foo', :template => 'bar' }
    p = Site.new(params)
    p.site_texts.build(:name => 't', :content => 'c')
    p.save
    
    p.texts.t.should eq('c')
    p.texts.respond_to?('t').should eq(true)
  end
  
  it "should provide access to files" do
    params = { :name => 'foo', :template => 'bar' }
    p = Site.new(params)
    p.site_files.build(:name => 'f', :path => '/f')
    p.save
    
    p.files.f.should eq('/f')
    p.files.respond_to?('f').should eq(true)
  end
  
  it "should raise missing text error" do
    params = { :name => 'foo', :content => 'bar' }
    p = Page.new(params)
    p.save
    lambda { p.texts.t }.should raise_error(MissingError) do |e|
      e.type.should eq('site global text')
      e.name.should eq('t')
    end
  end
  
  it "should raise missing file error" do
    params = { :name => 'foo', :content => 'bar' }
    p = Page.new(params)
    p.save
    lambda { p.files.f }.should raise_error(MissingError) do |e|
      e.type.should eq('site global file')
      e.name.should eq('f')
    end
  end
end
