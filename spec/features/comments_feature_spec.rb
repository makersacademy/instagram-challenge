require 'rails_helper'

feature 'Leaving comments' do

  scenario 'allows a user to leave a comment on photo' do
    sign_up
    leave_a_comment
    expect(current_path).to eq '/photos'
    expect(page).to have_content 'Meet Coco'
  end

end
