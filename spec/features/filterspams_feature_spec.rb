require 'rails_helper'

feature 'Filterspams' do

  before { sign_up_and_sign_in(email: 'user2@users.com') }
  before { visit '/' }

  context 'adding' do
    scenario 'should see the add filterspam link' do
      within(:css, 'div#feed_header') do
        expect(page).to have_link('Add filterspam')
      end
    end
    scenario 'clicking should take user to form, then display filterspam' do
      click_link 'Add filterspam'
      fill_in 'Comment', with: 'comment 2'
      attach_file 'Image', Rails.root.join("spec/features/feature_spec_img.png")
      click_button 'Create Filterspam'
      within(:css, 'div.filterspam') do
        expect(page).to have_content('By: user2@users.com')
        expect(page).to have_content('comment 2')
        expect(page).to have_css("img[src*='feature_spec_img.png']")
      end
    end
  end

  context 'deleting' do
    before do
      add_filterspam(email: 'user3@users.com',
                     image_name: 'feature_spec_img.png',
                     comment: 'comment 3')
      visit '/'
    end
    scenario 'should see the delete filterspam link' do
      within(:css, 'div.filterspam') do
        expect(page).to have_link('Delete')
      end
    end
    scenario 'clicking the link should delete the filterspam' do
      click_link 'Delete'
      expect(page).not_to have_content('By: user3@users.com')
      expect(page).not_to have_content('comment 3')
      expect(page).not_to have_css("img[src*='feature_spec_img.png']")
    end
  end

end
