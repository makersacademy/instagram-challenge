#As a user of InstaRails
#So I can show off my pictures
#I want to add a picture with title/description

require 'rails_helper'

describe 'Pictures features' do

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
