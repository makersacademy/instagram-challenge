require 'rails_helper'

feature 'reviewing' do
  scenario 'allows users to comment on a picture' do
    create_picture
    click_link '1'
    click_link 'Add a comment'
    fill_in 'Thoughts', with: 'Cute!'
    click_button 'Done'
    p current_path
    expect(page).to have_content('Cute!')
  end
end
