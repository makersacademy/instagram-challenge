require 'rails_helper'

feature 'commenting' do
  scenario 'allows users to comment on pictures' do
    visit '/pictures'
    click_link 'Add a picture'
    attach_file('picture[image]', 'spec/assets/images/wren_small.jpg')
    click_button 'Post'
    click_link 'Add a comment'
    fill_in 'Leave a comment...', with: 'Great picture!'
    click_button 'Submit'
    expect(current_path).to eq '/pictures'
    expect(page).to have_content('Great picture!')
  end
end
