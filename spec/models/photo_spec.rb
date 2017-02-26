require "rails_helper"

 describe Photo, type: :model do
   it { is_expected.to have_many(:comments).dependent :destroy }

   it { is_expected.to belong_to :user }

   describe "#belong_to" do
     it "returns true if a photo belongs to the current user" do
       user = FactoryGirl.create(:user)
       photo = FactoryGirl.create(:photo, user: user)
       expect(photo.belong_to?(user)).to eq true
     end
   end
 end
