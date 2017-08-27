describe ApplicationHelper do
  describe "#simple_pluralize" do
    it "returns the singular when the supplied count is one" do
      expect(simple_pluralize(1, "follower")).to eq "follower"
    end

    it "returns the plural when the supplied count is not one" do
      expect(simple_pluralize(2, "follower")).to eq "followers"
    end
  end
end
