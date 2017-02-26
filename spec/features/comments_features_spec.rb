require 'rails_helper'

feature 'Adding Comments' do
  let(:post_description) { "I love the sun" }
  let(:post_file_jpeg) { File.new('spec/photo1.jpg') }

  before do
    @user = User.create(email: 'test@test.com', password: 'test123')
    @post = @user.posts.create(image: post_file_jpeg, description: post_description)
    sign_in
  end

  scenario 'allows users to leave a comment using a form' do
     visit '/posts'
     click_link 'Add a comment'
     fill_in "Comment", with: "nice pic!"
     click_button 'Submit'

     expect(current_path).to eq '/posts'
     expect(page).to have_content('nice pic!')
  end

end
