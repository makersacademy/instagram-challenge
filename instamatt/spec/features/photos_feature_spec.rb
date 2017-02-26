require 'rails_helper'

feature 'photos' do
  context 'no photos exist in database' do
    scenario 'should prompt user to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos have been added - why not be the first?'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'a photo has been added' do
    before do
      Photo.create(description: "The test photo")
    end
    scenario 'user should see the photo description' do
      visit '/'
      expect(page).to have_content 'The test photo'
      expect(page).to_not have_content 'No photos have been added - why not be the first?'
    end
  end

  context 'adding photos' do
    scenario 'user can add a photo description' do
      visit '/'
      click_link 'Add a photo'
      fill_in 'Description', with: 'Another test description'
      click_button 'Add Photo'
      expect(page).to have_content 'Another test description'
      expect(page.current_path).to eq '/'
    end
  end

  context 'viewing photos' do

      before do
        visit '/'
        click_link 'Add a photo'
        fill_in 'Description', with: 'Another test description'
        page.attach_file("photo_image", Rails.root + 'app/assets/images/burger_king.jpg')
        click_button 'Add Photo'
      end
      scenario 'user can see a full display of photo and description' do
        visit '/'
        find(:xpath, "//a/img[@alt='Burger king']/..").click
        expect(page.current_path).to eq "/photos/#{Photo.first[:id]}"
    end
  end
end
