require 'rails_helper'

feature 'commenting' do
  before { Post.create(caption: 'Driving along the Amalfi coast', image: "https://cache-graphicslib.viator.com/graphicslib/thumbs674x446/7569/SITours/private-tour-amalfi-coast-from-sorrento-in-sorrento-288314.jpg") }

  scenario 'allows users to leave a comment' do
     visit '/posts'
     click_link 'Comment'
     fill_in "Comment", with: "Nice shot!"
     click_button 'Leave comment'

     expect(current_path).to eq '/posts'
     expect(page).to have_content('Nice shot!')
  end

end
