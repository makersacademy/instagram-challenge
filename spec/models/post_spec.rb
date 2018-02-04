require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:post) { create(:post) }

  it {is_expected.to be}

  describe "#reverse_order" do
    it "returns all posts in reverse order" do
      expect(Post.reverse_order).to eq(Post.all.reverse)
    end
  end
end
