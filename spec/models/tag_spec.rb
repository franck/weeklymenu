require 'spec_helper'

describe Tag do
  it "create a tag if everything is OK" do
    Tag.new(name: 'foo').should be_valid
  end

  it "raises an error if name is missing" do
    Tag.new(name: '').should_not be_valid
  end
end
