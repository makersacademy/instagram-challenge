require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  scenario 'a posts can be seen after being submitted' do
    visit '/posts/new'
    fill_in 'Pictureurl', with: 'www.google.it'
    fill_in 'Text', with: 'a google website'
    click_button 'Save Post'
    expect(page).to have_content("Picture www.google.it\nText: a google website")
  end
end