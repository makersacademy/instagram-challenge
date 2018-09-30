require 'rails_helper'

RSpec.describe Post, type: :model do
  before (:each) do
    date_time = Time.parse("2018-07-01 12:00:00 UTC")
    @post = Post.new(created_at: date_time)
  end

  describe "#convert_time" do
    it "converts server instantiated time and date to readable english time date" do
      expect(@post.convert_time).to eq("July  1, 2018 at 12:00 PM")
    end
  end
end
