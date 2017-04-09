require 'rails_helper'

describe Comment do

   it { should belong_to(:user) }
   it { should belong_to(:photo) }

   before do
     @user = User.create(username: 'hello123', email: 'hello@test.com', password: 'testtest')
     @photo = Photo.create(caption: "hi", location: "London", user_id: @user.id)
   end

   describe 'getting username' do
     it 'gets the username for each comment' do
       comment = Comment.create(content: "nice pic", user_id: @user.id)
       expect(comment.get_username).to eq "hello123"
     end
   end

end
