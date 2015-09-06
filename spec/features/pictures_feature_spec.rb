require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'displays a link to add a new picture' do
      user = build(:user)
      sign_up(user)
      visit '/pictures'
      expect(page).to have_content('No pictures yet!')
      expect(page).to have_link('Add a new picture')
    end
  end

  context 'pictures have been added' do
    before do
      user = build(:user)
      sign_up(user)
      visit '/pictures'
      click_link 'Add a new picture'
      fill_in 'Caption', with: 'Awesome narwhal'
      attach_file 'picture[image]', 'spec/assets/images/image01.png'
      click_button 'Create Picture'
    end

    scenario 'displaying pictures' do
      visit '/pictures'
      expect(page).to have_content('Awesome narwhal')
      expect(page).to have_selector('img')
    end

    scenario 'pictures are displayed with the username of their owner' do
      expect(page).to have_content('james')
    end

    scenario 'pictures are displayed with timestamp' do
      expect(page).to have_content('a moment ago')
    end
  end

  context 'uploading pictures' do
    scenario 'if not logged in, user unable to add a picture' do
      visit '/pictures'
      expect(page).not_to have_link('Add a new picture')
    end

    scenario 'when logged in, user able to add picture and caption' do
      user = build(:user)
      sign_up(user)
      visit '/pictures'
      click_link 'Add a new picture'
      fill_in 'Caption', with: 'Awesome narwhal'
      attach_file 'picture[image]', 'spec/assets/images/image01.png'
      click_button 'Create Picture'
      expect(page).to have_content('Awesome narwhal')
      expect(page).to have_selector('img')
    end
  end

  context 'editing captions' do
    before(:each) do
      user = build(:user)
      sign_up(user)
      visit '/pictures'
      click_link 'Add a new picture'
      fill_in 'Caption', with: 'Awesome narwhal'
      attach_file 'picture[image]', 'spec/assets/images/image01.png'
      click_button 'Create Picture'
    end

    scenario 'users not able to edit captions if they are not the owner' do
      click_link 'Sign out'
      userina = build(:userina)
      sign_up(userina)
      expect(page).not_to have_link('Edit caption')
    end

    scenario 'only owner of picture is able to edit their picture captions' do
      visit '/pictures'
      click_link 'Edit caption'
      fill_in 'Caption', with: 'Amazing narwhal!'
      click_button 'Update Picture'
      expect(page).to have_content('Amazing narwhal!')
    end
  end

  context 'deleting images' do
    before(:each) do
      user = build(:user)
      sign_up(user)
      visit '/pictures'
      click_link 'Add a new picture'
      fill_in 'Caption', with: 'Awesome narwhal'
      attach_file 'picture[image]', 'spec/assets/images/image01.png'
      click_button 'Create Picture'
    end

    scenario 'users not able to delete pictures if they are not the owner' do
      click_link 'Sign out'
      userina = build(:userina)
      sign_up(userina)
      expect(page).not_to have_link('Delete image')
    end

    scenario 'only owner of picture is able to delete their pictures' do
      visit '/pictures'
      click_link 'Delete image'
      expect(page).not_to have_content('Awesome narwhal')
      expect(page).not_to have_selector('img')
      expect(page).to have_content('Image successfully deleted')
    end

    scenario 'comments are deleted when an image is deleted' do
      visit '/pictures'
      click_link 'Comment'
      fill_in 'Thoughts', with: 'Love this'
      click_button 'Leave Comment'
      click_link 'Delete image'
      expect(page).not_to have_content('Love this')
    end
  end
end