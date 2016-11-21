require 'rails_helper'

feature 'photos'
  context 'no photos in feed' do

    scenario 'displays button to post a photo' do
      visit '/photos'
      expect(page).to have_content 'Post a photo'
    end

    scenario "displays 'no photos to show'" do
      visit '/photos'
      expect(page).to have_content 'No photos to show :('
    end

    scenario 'displays photo details on click' do
      post_a_photo
      photo =
      expect(current_path).to eq '/photos'
      click_link('pic')
      expect(current_path).to eq "/photos/2/comments/new"
    end
  end

  context 'photos added' do

    scenario 'can add a photo' do
      post_a_photo
      expect(current_path).to eq '/photos'
      expect(page.first('img')['src']).to have_content 'kitten.jpg'
    end

  end

  context 'editing photos' do

    scenario 'shows edit button for photos' do
      post_a_photo
      expect(page).to have_link 'edit'
    end

    scenario 'can successfully edit a photo' do
      post_a_photo
      click_link 'edit'
      edit_a_photo
      expect(current_path).to eq '/photos'
      expect(page).to have_content 'Hawk Hill'
      expect(page).to have_content 'Pretty view'
      expect(page).not_to have_content 'Dolores Park'
    end

  end

  context 'deleting a photo' do

    scenario 'shows delete button for photos' do
      post_a_photo
      expect(page).to have_link 'delete'
    end

    scenario 'can successfully delete a photo' do
      post_a_photo
      click_link 'delete'
      expect(current_path).to eq '/photos'
      expect(page).not_to have_content 'Dolores Park'
      expect(page).to have_content 'No photos to show :('
    end

  end
