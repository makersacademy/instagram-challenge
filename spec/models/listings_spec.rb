require "rails_helper"

describe Listing, type: :model do
  it { is_expected.to belong_to :user}

  context "creating a new listing" do
    it "takes a max time in mins since midnight" do
      listing = Listing.new(day: "Monday", start_time: (60*25))
      expect(listing).to have(1).error_on(:start_time)
    end

    it "stores the id of the user that created it" do
      user = build(:user)
      listing = Listing.new(day: "Monday", start_time: (10*60), user: user)
      expect(listing.user).to eq user
    end
  end


end
