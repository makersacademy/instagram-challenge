require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:comment) { create(:comment) }

  describe "Comment" do
    it { is_expected.to be }

    it "is a valid comment" do
      expect(comment).to be_valid
    end
  end
end
