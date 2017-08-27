require 'rails_helper'

RSpec.describe Post, type: :model do

  let!(:post) { create(:post) }

  describe "#time_ago" do
    it "returns the difference between .created_at and Time.now in plain english" do
      Timecop.freeze(Time.now + (60*60)) do
        expect(post.time_ago).to eq("1 hour ago")
      end
    end
  end
end
