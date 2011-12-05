require 'spec_helper'

describe SiteText do
  it "should be invalid without content" do
    SiteText.new.valid?.should eq(false)
  end
end
