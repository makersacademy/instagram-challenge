require 'rails_helper'
require 'feature_helper'

feature 'Creating posts' do
  scenario 'can create a post' do
    sign_up
    create_post("spec/files/images/castle.jpg", 'A lovely castle #wales')
    expect(page).to have_content('A lovely castle')
    expect(page).to have_css("img[src*='castle.jpg']")
  end
end