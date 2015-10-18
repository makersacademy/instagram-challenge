require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Post a photo'
    end
  end

  context 'viewing photos' do
    let!(:test_pic){Photo.create(name:'test_picture')}
    # scenario 'lets a user view a photo' do
    #   visit '/photos'
    #   click_link 'test_picture'
    #   expect(current_path).to eq("/photos/#{test_pic.id}")
    #   expect(page).to have_link 'Back to Feed'
    # end

    scenario 'display photos' do
    visit '/photos'
    expect(page).to have_content('test_picture')
    expect(page).not_to have_content('No photos yet')
    end
  end

  context 'adding photos' do
    before do
      Photo.create(image: File.new(Rails.root + 'spec/asset_specs/photos/test_photo.jpg'), description: 'A sweet sunset shot')
    end

    scenario 'prompts user to fill out a form, then displays the new photo' do
      visit '/photos'
      expect(page).to have_content 'A sweet sunset shot'
      expect(page).not_to have_content 'No photos yet'
      expect(current_path).to eq '/photos'
    end
  end
end

# def add_photo
#   click_link "Post a photo"
#   fill_in 'Name', with: 'Sunset'
#   fill_in 'Description', with: 'A sweet sunset shot'
#   attach_file 'image', 'spec/asset_specs/photos/test_photo.jpg'
#   click_button 'Post photo'
# end
