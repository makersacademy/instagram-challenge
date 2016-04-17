require 'rails_helper'

feature 'posting photos' do
  context 'posting photos' do

    scenario 'can post new photo' do
      visit '/'
      click_link 'Add Photo'
      attach_file('Image', 'spec/files/images/DOGE.jpg')
      fill_in 'Caption', with: 'much doge'
      click_button 'Create Picture'
      expect(page).to have_content 'much doge'
      expect(page).to have_css("img[src*='DOGE']")
    end

    scenario 'needs an image to create a post' do
      visit '/'
      click_link 'Add Photo'
      fill_in 'Caption', with: 'much doge'
      click_button 'Create Picture'
      expect(page).to have_content 'Woa there, you have to upload an image!'
    end
  end

  context 'adding multiple photos' do
    scenario 'displays a list of all photos' do
      pic_one = create(:picture)
      pic_two = create(:picture, caption: 'such cool')
      visit '/'
      expect(page).to have_content('much doge')
      expect(page).to have_content('such cool')
      expect(page).to have_css("img[src*='DOGE']")
    end
  end

 context 'individual picture display' do
   scenario 'renders page for single picture' do
    picture = create(:picture)
    visit '/'
    find(:xpath, "//a[contains(@href,'pictures/#{picture.id}')]").click
    expect(page.current_path).to eq(picture_path(picture.id))
  end
 end

 context 'edit posted pictures' do
    background do
      picture = create(:picture)
      visit '/'
      find(:xpath, "//a[contains(@href,'pictures/#{picture.id}')]").click
      click_link 'Edit Picture'
    end

    scenario 'can update posted photos' do
      fill_in 'Caption', with: 'much cool, wow'
      click_button 'Update Picture'
      expect(page).to have_content 'Picture updated!'
      expect(page).to have_content 'much cool, wow'
    end

    scenario 'can cancel edit' do
      click_link 'Cancel'
      expect(current_path).to eq('/pictures/1')
    end
  end

  context 'deleting pictures' do
    scenario 'can delete posted pictures' do
      picture = create(:picture)
      visit '/'
      find(:xpath, "//a[contains(@href,'pictures/#{picture.id}')]").click
      click_link 'Edit Picture'
      click_link 'Delete Picture'
      expect(current_path).to eq pictures_path
      expect(page).to have_content('Your picture has been deleted')
      expect(page).not_to have_css("img[src*='DOGE']")
    end
  end
end
