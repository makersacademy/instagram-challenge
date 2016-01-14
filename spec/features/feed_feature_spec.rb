require 'rails_helper'

feature 'Feed' do

  before do
    sign_up_and_sign_in(email: 'user2@users.com', username: 'user2')
  end

  context 'when no filterspams posted' do
    scenario 'should see the "no filterspams" message' do
      expect(page).to have_content('No filterspams :(')
    end
  end

  context 'when one filterspam has been posted' do
    before do
      add_filterspam(email: 'user1@users.com',
                     username: 'user1',
                     image_name: 'feature_spec_img.png',
                     comment: 'comment 1')
      visit '/'
    end
    scenario 'should display the author\'s name' do
      within(:css, 'div.filterspam') do
        expect(page).to have_content('By: user1@users.com')
      end
    end
    scenario 'should display the comment' do
      within(:css, 'div.filterspam') do
        expect(page).to have_content('comment 1')
      end
    end
    scenario 'should display the image' do
      within(:css, 'div.filterspam') do
        expect(page).to have_css("img[src*='feature_spec_img.png']")
      end
    end
    scenario 'should remove the "no filterspams" message' do
      expect(page).not_to have_content('No filterspams :(')
    end
  end

end
