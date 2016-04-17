require "rails_helper"

describe Photo, type: :model do
  it { is_expected.to have_many(:comments).dependent :destroy }

  it { is_expected.to belong_to :user }

  it { is_expected.to have_many(:likes).dependent :destroy }

  describe "#created_by?" do
    it "returns true if the user created the photo" do
      user = FactoryGirl.create(:user)
      photo = FactoryGirl.create(:photo, user: user)
      expect(photo.created_by?(user)).to eq true
    end
  end

  describe "#time_posted" do
    it "displays when the photo is created relative to now" do
      photo = FactoryGirl.create(:photo, created_at: Time.parse("2016-04-17 9:02:56 +0000"))
      now = Time.parse("2016-04-17 13:02:56 +0100")
      allow(Time).to receive(:now).and_return(now)
      expect(photo.time_posted).to eq "4h"
    end
  end
end
