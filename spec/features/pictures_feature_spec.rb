require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'pictures have been added' do
  before do
    Picture.create(caption: 'Image1', src: 'test-image')
  end

  scenario 'display pictures' do
    visit '/pictures'
    click_link 'Add a picture'
    fill_in 'Caption', with: 'Hebrides'
    page.attach_file('picture_image', Rails.root + 'IMG_4016.jpg')
     click_button 'Create Picture'
     expect(page).to have_css("img[src*='IMG_4016.jpg']")
  end
end


context 'creating pictures' do
  scenario 'prompts user to fill out a form, then displays the new picture' do
    visit '/pictures'
    click_link 'Add a picture'
    fill_in 'Caption', with: 'Image1'
    click_button 'Create Picture'
    expect(page).to have_content 'Image1'
    expect(current_path).to eq '/pictures'
  end
end

context 'viewing pictures' do

  let!(:image1){ Picture.create(caption:'Image1') }

  scenario 'lets a user view a picture' do
   visit '/pictures'
   click_link 'Image1'
   expect(page).to have_content 'Image1'
   expect(current_path).to eq "/pictures/#{image1.id}"
  end

end

context 'deleting pictures' do

  scenario 'removes a picture when a user clicks a delete link' do
    visit '/pictures'
    click_link 'Add a picture'
    fill_in 'Caption', with: 'Hebrides'
    page.attach_file('picture_image', Rails.root + 'IMG_4016.jpg')
     click_button 'Create Picture'
    click_link 'Delete Hebrides'
    expect(page).not_to have_content 'Hebrides'
    expect(page).to have_content 'Picture deleted successfully'
  end

end
end
