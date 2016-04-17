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
    context "displays when the photo is posted relative to now" do
      before do
        now = Time.parse("2016-04-17 13:02:56 +0100")
        allow(Time).to receive(:now).and_return(now)
      end

      it "displays the hour difference if photo posted on the same day" do
        photo = FactoryGirl.create(:photo, created_at: Time.parse("2016-04-17 09:02:56 +0100"))
        expect(photo.time_posted).to eq "4h"
      end

      it "displays the day difference if photo posted on a different day" do
        photo = FactoryGirl.create(:photo, created_at: Time.parse("2016-04-15 09:02:56 +0100"))
        expect(photo.time_posted).to eq "2d"
      end
    end
  end

  describe "#posted_today?" do
    before do
      now = Time.parse("2016-04-17 13:02:56 +0100")
      allow(Time).to receive(:now).and_return(now)
    end

    it "returns true if photo is posted today" do
      photo = FactoryGirl.create(:photo, created_at: Time.parse("2016-04-17 09:02:56 +0000"))
      expect(photo).to be_posted_today
    end

    it "returns false if photo is not posted today" do
      photo = FactoryGirl.create(:photo, created_at: Time.parse("2016-04-15 09:02:56 +0000"))
      expect(photo).not_to be_posted_today
    end
  end
end
