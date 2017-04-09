require 'rails_helper'

describe Photo do

   it { should belong_to(:user) }

   before do
     @user = User.create(username: 'hello123', email: 'hello@test.com', password: 'testtest')
   end

   describe 'getting username' do
     it 'gets the username for each photo' do
       photo = Photo.create(caption: "hi", location: "London", user_id: @user.id)
       expect(photo.get_username).to eq "hello123"
     end
   end

end
