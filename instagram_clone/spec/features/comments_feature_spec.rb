require 'rails_helper'

feature 'Commenting' do

  before do
    Photo.create(caption: 'bicken')
  end

  scenario 'allows users to leave a comment on a photo' do
    visit '/photos'
    click_link 'Leave comment'
    fill_in :Thoughts, with: "I love it!"
    click_button 'Create Comment'
    expect(page).to have_content('I love it!')
  end
end
