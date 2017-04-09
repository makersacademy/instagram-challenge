require 'rails_helper'

describe Photo do

   it { should belong_to(:user) }

   before :each do
     @user = User.create(username: 'hello123', email: 'hello@test.com', password: 'testtest')
     @photo = Photo.create(caption: "hi", location: "London", user_id: @user.id)

   end

   describe 'getting username' do
     it 'gets the username for each photo' do
       expect(@photo.get_username).to eq "hello123"
     end
   end

   describe 'likes' do
     context 'user did not like photo' do
       it 'checks if it has not been liked by a specific user' do
         expect(@photo.liked_by?(@user)).to eq false
       end
     end

     context 'user liked photo' do
       it 'checks if it has been liked by a specific user' do
         Like.create(photo_id: @photo.id, user_id: @user.id)
         expect(@photo.liked_by?(@user)).to eq true
       end
     end
   end
end
