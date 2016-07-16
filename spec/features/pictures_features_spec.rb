require 'rails_helper'

describe 'Pictures features' do

  context 'default' do

    #As a user of InstaRails
    #So I can show off my pictures
    #I want to add a picture with title/description

    scenario('user adds a picture, this is then shown on pictures index page') do
      visit('/pictures/new')
      fill_in('Title', with: 'lovely pic')
      fill_in('Description', with: 'me and my friends havin a blast')
      click_button('Save Picture')
      visit('/pictures')
      expect(page).to have_content('lovely pic')
      expect(page).to have_content('me and my friends havin a blast')
    end
  end

  context 'when a picture has been created' do
  
    before do
      Picture.create(title: 'lovely pic', description: 'me and my friends')
    end

    #As a user of InstaRails
    #So I can express my opinions on pictures
    #I want to add a comment for a picture

    scenario('user adds a comment to a picture, this is shown on pictures index page') do
      visit('/pictures')
      click_link('Add comment')
      fill_in('Comment', with: 'lovely shot')
      click_button('Submit')
      expect(page).to have_content('lovely shot')
    end
  end

end
