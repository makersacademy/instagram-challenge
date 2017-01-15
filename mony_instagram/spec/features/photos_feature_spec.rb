require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'photos have been added' do
    before do
      Photo.create!(caption: 'A perfect belated birthday moment!')
    end

    scenario 'display photos' do
      visit '/photos'
      expect(page).to have_content('A perfect belated birthday moment!')
      expect(page).not_to have_content('No photos yet')
    end

  end

  context 'creating photos' do
    scenario 'prompts user to fill out a form, then displays the new photo' do
      visit('/photos')
      click_link('Add a photo')
      fill_in('Caption', with: 'A perfect belated birthday moment!')
      click_button('Create Photo')
      expect(page).to have_content 'A perfect belated birthday moment!'
      expect(current_path).to eq '/photos'
    end
  end

  # context 'viewing photos' do
  #   let!(:sunset){ Photo.create(caption: 'A beautifull sunset') }
  #
  #   scenario 'let a user view a photo ' do
  #     visit '/photos'
  #     click_link '
  #   end
  # end

end
