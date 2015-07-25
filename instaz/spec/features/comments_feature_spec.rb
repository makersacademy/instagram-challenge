require 'rails_helper'

feature 'commenting' do
  before do 
    add_photo
  end

  scenario 'allow users to leave comments using a form' do
     visit '/'
     click_link 'Comment'
     fill_in 'Leave a comment', with: 'GRUMPY CAT!!'
     click_button 'Submit'
     expect(current_path).to eq '/photos'
     expect(page).to have_content('GRUMPY CAT!!')
  end
  
  scenario 'comments get deleted with the photo' do
    add_comment
    click_link 'Grumpy cat'
    click_link 'Delete photo'
    expect(page).not_to have_content 'GRUMPY CAT!!'
  end


end