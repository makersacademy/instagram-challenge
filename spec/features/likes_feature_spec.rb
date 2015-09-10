require 'rails_helper'

feature 'adding hearts to photos' do
  before do
    user = build(:user)
    sign_up(user)
    visit photos_path
    click_link 'Add a photo'
    fill_in 'Caption', with: 'lazy cat'
    attach_file "photo[image]", 'spec/assets_spec/images/cat.png'
    click_button "Create Photo"
  end

  # scenario 'users can put a single heart on each photo' do
  #   click_link 'heart'
  #   expect(page).to have_content('1 heart')
  # end
end