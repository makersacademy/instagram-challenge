require 'rails_helper'
require 'feature_helper'

feature 'Displaying posts' do
  scenario 'homepage shows multiple posts' do
    sign_up
    create_post("spec/files/images/castle.jpg", 'A lovely castle #wales')
    create_post("spec/files/images/lighthouse.jpg",'A lovely lighthouse #wales')
    expect(page).to have_content('A lovely castle')
    expect(page).to have_css("img[src*='castle.jpg']")
    expect(page).to have_content('A lovely lighthouse')
    expect(page).to have_css("img[src*='lighthouse.jpg']")
  end
end