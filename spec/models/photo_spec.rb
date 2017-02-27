require "rails_helper"

 describe Photo, type: :model do
   it { is_expected.to have_many(:comments).dependent :destroy }

   it { is_expected.to belong_to :user }

   describe "#created_by" do
     it "returns true if a photo was added by the current user" do
       user = FactoryGirl.create(:user)
       photo = FactoryGirl.create(:photo, user: user)
       expect(photo.created_by?(user)).to eq true
     end
   end
 end
