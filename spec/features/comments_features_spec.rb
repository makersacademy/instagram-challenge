require 'rails_helper'

feature 'comments' do

  let!(:cat){Photo.create(title:'cat', image_file_name: 'spec/assets/cats.jpg')}

  scenario 'allows users to leave a comment using a form' do
    visit '/photos'
    click_link '💬'
    fill_in "Thoughts", with: 'So cute!'
    click_button 'Add comment'
    expect(current_path).to eq '/photos'
    expect(page).to have_content('So cute!')
  end






end
