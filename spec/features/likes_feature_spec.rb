require 'spec_helper'

feature 'Likes' do

  before do
    user = create :user
    log_in(user)
    click_link 'Add a picture'
    attach_file('picture[image]', File.join(Rails.root,'spec',"files", 'images', 'duck.jpg'))
    fill_in 'Name', with: 'Kiss'
    fill_in 'Description', with: 'You'
    click_button 'Create Picture'
    visit '/'
    click_link 'Kiss'
    click_link 'Like'
  end


  context 'when no likes' do

    scenario 'can like a picture' do
      expect(page).to have_content '1 like'
    end

  end

  context 'when there are likes' do

    scenario 'can delete a like' do
      click_link '1 like'
      expect(page).not_to have_content '1 like'
    end

    scenario 'cannot like the same picture twice' do
      click_link '1 like'
      expect(page).to have_content 'Like'
    end
  end


end
