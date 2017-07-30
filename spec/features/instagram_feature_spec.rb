require 'rails_helper'

feature 'images' do
  context 'no images uploaded yet' do
    scenario 'should display a prompt to add an image' do
      visit '/images'
      expect(page).to have_content 'No images uploaded yet'
      expect(page).to have_link 'New Post'
    end
  end

  context 'images uploaded' do
    before do
      Image.create(title: 'Holiday snap', image: "afternoon-tea.jpg")
    end

    scenario 'display images' do
      visit '/images'
      click_link 'New Post'
      fill_in 'Title', with: 'Holiday snap'
      attach_file('Image', './app/assets/images/afternoon-tea.jpg')
      click_button 'Post'
      expect(page).to have_content('Holiday snap')
      expect(page).not_to have_content('No images uploaded yet')
    end
  end

  context 'creating titles for images' do
    scenario 'user fills out a form which displays the title of the image' do
      visit '/images'
      click_link 'New Post'
      fill_in 'Title', with: 'My dying cactus'
      click_button 'Post'
      expect(page).to have_content 'My dying cactus'
      expect(current_path).to eq '/images'
    end
  end

  context 'viewing image titles' do
    let!(:disneyland){ Image.create(title: 'Disneyland') }

    scenario 'lets a user view their uploaded image titles' do
      visit '/images'
      click_link 'Disneyland'
      expect(page).to have_content 'Disneyland'
      expect(current_path).to eq "/images/#{disneyland.id}"
    end
  end

  context 'editing image titles' do

    before { Image.create title: 'Garden Party', id: 1 }
    scenario 'let a user edit an image title' do
      visit '/images'
      click_link 'Edit Post'
      fill_in 'Title', with: 'Afternoon Tea'
      click_button 'Update Post'
      click_link 'Afternoon Tea'
      expect(page).to have_content 'Afternoon Tea'
      expect(current_path).to eq '/images/1'
    end
  end

  context 'deleting images' do
    before { Image.create title: 'Woodland Adventure'}

    scenario 'deletes an image when a user clicks delete' do
      visit '/images'
      click_link 'Delete Post'
      expect(page).not_to have_content 'Woodland Adventure'
      expect(page).to have_content 'Post deleted successfully'
    end
  end
end
