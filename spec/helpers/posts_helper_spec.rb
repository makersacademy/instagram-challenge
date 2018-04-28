require 'posts_helper'

RSpec.describe PostsHelper, type: :helper do

  describe "#get_time" do
    context "Stub time - singular" do
      it "returns relative post time in seconds - singular" do
        allow(helper).to receive(:calculator).and_return(1)
        expect(helper.get_time(1)).to eq("Posted 1 second ago")
      end

      it "returns relative post time in minutes - singular" do
        allow(helper).to receive(:calculator).and_return(61)
        expect(helper.get_time(1)).to eq("Posted 1 minute ago")
      end
    end

  end
end
