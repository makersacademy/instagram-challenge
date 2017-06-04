require 'rails_helper'

RSpec.feature 'Like', type: :feature do

  before(:each) do
    sign_up
    upload_photo
    visit("/")
  end

  scenario 'User can like photos' do
    click_on 'Like'
    expect(page).to have_content('Likes: 1')
  end

  scenario 'User can like a post only once' do
    click_on 'Like'
    click_on 'Like'
    expect(page).not_to have_content('Likes: 2')
  end
end
