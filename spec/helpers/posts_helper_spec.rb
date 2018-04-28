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

      it "returns relative post time in hours - singular" do
        allow(helper).to receive(:calculator).and_return(3601)
        expect(helper.get_time(1)).to eq("Posted 1 hour ago")
      end

      it "returns relative post time in days - singular" do
        allow(helper).to receive(:calculator).and_return(86401)
        expect(helper.get_time(1)).to eq("Posted 1 day ago")
      end

      it "returns relative post time in weeks - singular" do
        allow(helper).to receive(:calculator).and_return(604801)
        expect(helper.get_time(1)).to eq("Posted 1 week ago")
      end

      it "returns relative post time in years - singular" do
        allow(helper).to receive(:calculator).and_return(31536001)
        expect(helper.get_time(1)).to eq("Posted 1 year ago")
      end
    end

    context "Stub time - plural" do
      it "returns relative post time in seconds - plural" do
        allow(helper).to receive(:calculator).and_return(2)
        expect(helper.get_time(1)).to eq("Posted 2 seconds ago")
      end

      it "returns relative post time in minutes - plural" do
        allow(helper).to receive(:calculator).and_return(121)
        expect(helper.get_time(1)).to eq("Posted 2 minutes ago")
      end

      it "returns relative post time in hours - plural" do
        allow(helper).to receive(:calculator).and_return(7201)
        expect(helper.get_time(1)).to eq("Posted 2 hours ago")
      end

      it "returns relative post time in days - plural" do
        allow(helper).to receive(:calculator).and_return(172801)
        expect(helper.get_time(1)).to eq("Posted 2 days ago")
      end

      it "returns relative post time in weeks - plural" do
        allow(helper).to receive(:calculator).and_return(1209601)
        expect(helper.get_time(1)).to eq("Posted 2 weeks ago")
      end

      it "returns relative post time in years - plural" do
        allow(helper).to receive(:calculator).and_return(63072002)
        expect(helper.get_time(1)).to eq("Posted 2 years ago")
      end
    end
  end
end
