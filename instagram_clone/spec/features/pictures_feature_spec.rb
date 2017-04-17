require 'rails_helper'

feature 'Pictures' do

  context 'Website when initialized' do
    scenario 'should display link to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'creating pictures' do
    scenario "can not create restaurant if not signed in" do
      visit '/pictures'
      click_link 'Add a picture'
      expect(page).to have_content 'Log in'
    end

    scenario 'image of picture is displayed' do
      user = build :user
      sign_up(user)
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Title', with: 'Holiday'
      attach_file "picture_image", "spec/fixtures/image3.png"
      click_button 'Create Picture'
      #make capybara test for image on page
      expect(page).to have_content('Holiday')
      expect(page).not_to have_content('No pictures yet')
      # expect(page).to have_css 'img', src: 'image3.png'
      # expect(page).to have_css("img[src='image3.jpg']")
      # expect(page).to have_selector("img[src='/spec/fixtures/image3']")
    end

    scenario 'title of picture is displayed' do
      user = build :user
      sign_up(user)
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Title', with: 'Holiday'
      click_button 'Create Picture'
      expect(page).to have_content 'Holiday'
    end
  end

  context 'viewing pictures' do
    let!(:holiday){Picture.create(title:'Holiday')}
    scenario 'let a user view the enlarged picture when they click on the title' do
      visit '/pictures'
      click_link 'Holiday'
      expect(page).to have_content 'Holiday'
      expect(current_path).to eq "/pictures/#{holiday.id}"
    end
  end

  context 'editing pictures' do
    scenario 'user can change the title of a picture' do
      user = build :user
      sign_up(user)
      click_link 'Add a picture'
      fill_in 'Title', with: 'Holiday'
      attach_file "picture_image", "spec/fixtures/image3.png"
      click_button 'Create Picture'
      click_link 'Edit Holiday'
      fill_in 'Title', with: 'My Holiday'
      click_button 'Update Picture'
      expect(page).to have_content 'My Holiday'
    end
  end

  context 'deleting pictures' do
    scenario 'deleting removes picture and respective comments' do
      user = build :user
      sign_up(user)
      click_link 'Add a picture'
      fill_in 'Title', with: 'Holiday'
      attach_file "picture_image", "spec/fixtures/image3.png"
      click_button 'Create Picture'
      click_link 'Comment on Holiday'
      fill_in "Comment", with: 'SO sunny'
      click_button 'Leave Comment'
      click_link 'Delete Holiday'
      expect(page).not_to have_content 'My Holiday'
      expect(page).not_to have_content 'SO sunny'
      expect(page).to have_content 'Picture deleted successfully'
    end
  end

end
