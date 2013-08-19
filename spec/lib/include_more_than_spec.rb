require 'include_more_than'
describe "#include_more_than" do

  context "with duplicates_number = 0" do
    it "returns true if element already present" do
      ['aa', 'bb'].include_more_than?('aa', 0).should be_true
    end
    it "returns false if element is not present" do
      ['aa', 'bb'].include_more_than?('cc', 0).should be_false
    end
  end

  context "with duplicates_number = 1" do
    it "returns true if element already present twice" do
      ['aa', 'aa', 'bb'].include_more_than?('aa', 1).should be_true
    end
    it "returns false if element is not present twice" do
      ['aa', 'bb'].include_more_than?('aa', 1).should be_false
    end
  end

end
