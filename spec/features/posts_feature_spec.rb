require 'rails_helper'

feature 'posts' do
  context 'no images have been added' do
    scenario 'should display a prompt to add a  photo' do
      visit '/posts'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'photo has been uploaded' do

    before { Post.create title: 'Vacation'}

    scenario 'display photos' do
      visit '/posts'
      expect(page).to have_content 'Vacation'
      expect(page).not_to have_content 'No photos yet'
    end
  end

  context 'uploading a photo' do
    scenario 'prompts a user to fill out a for and then displays the photo' do
      visit '/posts'
      click_link 'Add a photo'
      fill_in 'Title', with: 'Vacation'
      click_button 'Create Post'
      expect(page).to have_content 'Vacation'
      expect(current_path).to eq '/posts'
    end
  end

  context 'viewing photos' do
    let!(:vacation){Post.create(title:'Vacation')}

    scenario 'lets a user view a photo' do
      visit '/posts'
      click_link 'Vacation'
      expect(page).to have_content 'Vacation'
      expect(current_path).to eq "/posts/#{vacation.id}"
    end
  end

  context 'deleting posts' do

    before { Post.create title: 'Vacation'}

    scenario 'removes a photo when a user clicks a delete link' do
      visit '/posts'
      click_link 'Vacation'
      click_link 'Delete Vacation'
      expect(page).not_to have_content 'Vacation'
      expect(page).to have_content 'Photo deleted successfully'
    end
  end

end




