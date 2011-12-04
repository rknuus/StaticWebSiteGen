require 'spec_helper'

describe Site do
  it "should be invalid without name or template" do
    Site.new.valid?.should eq(false)
  end
end
