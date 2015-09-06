require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a pictures' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'pictures have been added' do
    before do
      Picture.create(image: 'Kitten', description: 'kittens!')
    end

    scenario 'displays image' do
      visit '/pictures'
      expect(page).to have_content('Kitten')
      expect(page).not_to have_content('No pictures yet')
    end

    scenario 'displays description' do
      visit '/pictures'
      expect(page).to have_content('kittens!')
    end

  end

  context 'adding pictures' do

    scenario 'prompts user to fill out a form, then displays the new picture' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Image', with: 'Kitten'
      fill_in 'Description', with: 'kittens!'
      click_button 'Create Picture'
      expect(page).to have_content 'Kitten'
      expect(current_path).to eq '/pictures'
    end

    context 'an invalid picture' do
      it 'does not let you submit an image with no desciption' do
        visit '/pictures'
        click_link 'Add a picture'
        fill_in 'Image', with: 'Kitten'
        fill_in 'Description', with: ''
        click_button 'Create Picture'
        expect(page).not_to have_css 'h2', text: 'Kitten'
        expect(page).to have_content 'Description is too short (minimum is 1 character)'
      end
    end
  end

  context 'viewing restaurants' do

    let!(:kitten){Picture.create(image:'Kitten', description: 'kittens!')}

    scenario 'lets a user view a picture' do
     visit '/pictures'
     click_link 'Kitten'
     expect(page).to have_content 'Kitten'
     expect(current_path).to eq "/pictures/#{kitten.id}"
    end
  end

  context 'editing pictures' do

    before {Picture.create(image:'Kitten', description: 'kittens!')}

    scenario 'let a user edit a picture' do
     visit '/pictures'
     click_link 'Edit Picture'
     fill_in 'Image', with: 'Puppy'
     click_button 'Update Picture'
     expect(page).to have_content 'Puppy'
     expect(current_path).to eq '/pictures'
    end
  end

  context 'deleting pictures' do

    before {Picture.create(image:'Kitten', description: 'kittens!')}

    scenario 'removes a picture when a user clicks a delete link' do
      visit '/pictures'
      click_link 'Delete Picture'
      expect(page).not_to have_content 'Kitten'
      expect(page).to have_content 'Picture deleted successfully'
    end
  end

end