require 'rails_helper'

feature 'commenting' do
  # let(:user_id) {User.create(id: 1, username: 'JohnSmith', email: 'test@123.com', password: 'password', uid: 1 ) }

  scenario 'allows users to leave a comment' do
    # post = Post.create(caption: 'Driving along the Amalfi coast', image: "https://cache-graphicslib.viator.com/graphicslib/thumbs674x446/7569/SITours/private-tour-amalfi-coast-from-sorrento-in-sorrento-288314.jpg", user_id: user_id)
    visit ('/users/sign_up')
    signup
    add_post
    click_link 'Leave Comment...'
    fill_in "Content", with: "Nice shot!"
    click_button 'Leave comment'
    expect(current_path).to eq '/posts'
    expect(page).to have_content('Nice shot!')
  end

end
