require 'posts_helper'

RSpec.describe PostsHelper, type: :helper do

  describe "#get_time" do
    it "set time posted attribute" do
      allow(helper).to receive(:calculator).and_return(1)
      expect(helper.get_time(1)).to eq("Posted 1 second ago")
    end
  end
end
