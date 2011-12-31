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
  
  it "should provide access to texts" do
    params = { :name => 'foo', :content => 'bar' }
    p = Page.new(params)
    p.page_texts.build(:name => 't', :content => 'c')
    p.save
    
    p.texts.t.should eq('c')
    p.texts.respond_to?('t').should eq(true)
  end
  
  it "should provide access to files" do
    params = { :name => 'foo', :content => 'bar' }
    p = Page.new(params)
    p.page_files.build(:name => 'f', :path => 'files/f', :source_path => '/foo/f')
    p.save
    
    p.files.f.should eq('files/f')
    p.files.respond_to?('f').should eq(true)
  end
  
  it "should raise missing text error" do
    params = { :name => 'foo', :content => 'bar' }
    p = Page.new(params)
    p.save
    lambda { p.texts.t }.should raise_error(MissingError) do |e|
      e.type.should eq('page text')
      e.name.should eq('t')
    end
  end
  
  it "should raise missing file error" do
    params = { :name => 'foo', :content => 'bar' }
    p = Page.new(params)
    p.save
    lambda { p.files.f }.should raise_error(MissingError) do |e|
      e.type.should eq('page file')
      e.name.should eq('f')
    end
  end
end
