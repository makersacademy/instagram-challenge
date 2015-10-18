require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      user = create :user
      sign_in_as(user)
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'pictures have been added' do

    before {Picture.create(image_file_name: 'spec/assets/images/dism.jpg')}

    scenario 'display pictures' do
      user = create :user
      sign_in_as(user)
      visit '/pictures'
      expect(page).to have_xpath("//img[@alt='Dism']")
      expect(page).not_to have_content('No pictures yet')
    end
  end

  context 'creating pictures' do
    scenario 'prompts user to fill out a form, then displays the new picture' do
      user = create :user
      sign_in_as(user)
      visit '/pictures'
      click_link 'Add a picture'
      attach_file 'picture[image]', 'spec/assets/images/dism.jpg'
      click_button 'Create Picture'
      expect(page).to have_xpath("//img[@alt='Dism']")
      expect(current_path).to eq '/pictures'
    end
    scenario 'the new picture appears above an old one' do
      user = create :user
      sign_in_as(user)
      visit '/pictures'
      click_link 'Add a picture'
      attach_file 'picture[image]', 'spec/assets/images/dism.jpg'
      click_button 'Create Picture'
      click_link 'Add a picture'
      attach_file 'picture[image]', 'spec/assets/images/choc.jpg'
      click_button 'Create Picture'
      expect(page.body.index('Choc')).to be < (page.body.index('Dism'))
    end
  end

  context 'deleting pictures' do

    before do
      user = create :user
      sign_in_as(user)
      visit '/pictures'
      click_link 'Add a picture'
      attach_file 'picture[image]', 'spec/assets/images/dism.jpg'
      click_button 'Create Picture'
    end

    scenario 'lets a user delete picture he added' do
      click_link 'Delete'
      expect(page).not_to have_xpath("//img[@alt='Dism']")
      expect(page).to have_content 'Picture deleted successfully'
    end

    scenario 'does not let user delete another user\'s picture' do
      click_link 'Sign out'
      user2 = create(:user, email: 'test2@example.com')
      sign_in_as(user2)
      expect(page).not_to have_link 'Delete'
    end

end

end