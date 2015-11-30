require 'rails_helper'

feature 'Signed in user can post a filterspam' do
  before do
    sign_up_and_sign_in(email: 'user0@users.com', password: 'password')
  end
  scenario 'should see the add filterspam link' do
    within(:css, 'div#feed_header') do
      expect(page).to have_link('Add filterspam')
    end
  end
  scenario 'prompt user to fill out form, then display filterspam' do
    visit '/'
    click_link 'Add filterspam'
    fill_in 'Comment', with: 'This is a comment'
    attach_file 'Image', Rails.root.join("spec/features/feature_spec_img.png")
    click_button 'Create Filterspam'
    within(:css, 'div.filterspam') do
      expect(page).to have_content('This is a comment')
      expect(page).to have_css("img[src*='feature_spec_img.png']")
    end

  end


end
