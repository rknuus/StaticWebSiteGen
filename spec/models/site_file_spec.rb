require 'spec_helper'

describe SiteFile do
  it "should be invalid without name or path" do
    SiteFile.new.valid?.should eq(false)
  end
end
