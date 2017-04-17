require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/pictures'
      expect(page).to have_link 'Add a picture'
      expect(page).to have_content 'No pictures yet'
    end
  end

  context 'pictures have been added' do
    before do
      Picture.create(name:'test',
                     avatar_file_name: 'test.jpg',
                     avatar_file_size: '10',
                     avatar_content_type: 'image/jpeg')
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content('test')
      expect(page).not_to have_content('No pictures yet')
    end
  end

  context 'viewing pictures' do

    let!(:test){Picture.create(name:'test',
                               avatar_file_name: 'test.jpg',
                               avatar_file_size: '10',
                               avatar_content_type: 'image/jpeg')}

    scenario 'lets a user view a picture' do
      visit '/pictures'
      click_link 'view'
      expect(page).to have_content 'test'
      expect(current_path).to eq "/pictures/#{test.id}"
    end
  end

  context 'when not logged in' do

    scenario 'a visitor cannot add a picture' do
      visit '/pictures'
      click_link 'Add a picture'
      expect(page).to have_content 'Log in'
    end

    scenario 'a visitor cannot delete a picture' do
      Picture.create(name:'another test',
                     avatar_file_name: 'test.jpg',
                     avatar_file_size: '10',
                     avatar_content_type: 'image/jpeg')

      visit '/pictures'
      click_link 'delete'
      expect(page).to have_content 'Log in'
    end

    scenario 'a visitor cannot edit a picture' do
      Picture.create(name:'another test',
                     avatar_file_name: 'test.jpg',
                     avatar_file_size: '10',
                     avatar_content_type: 'image/jpeg')

      visit '/pictures'
      click_link 'edit'
      expect(page).to have_content 'Log in'
    end
  end

  context 'when logged in' do

    before do
      sign_up
    end

    context 'uploading pictures' do
      scenario 'prompts user to fill out a form, then displays the new picture' do
        new_picture
        expect(page).to have_content 'test'
        expect(page).to have_css('img[src*="test.jpg"]')
      end
    end

    context 'an invalid picture' do
      it 'does not let you submit a blank name' do
        visit '/pictures'
        click_link 'Add a picture'
        click_button 'Create Picture'
        expect(page).to have_content 'error'
      end
      it 'does not let you select no image' do
        visit '/pictures'
        click_link 'Add a picture'
        fill_in 'Name', with: 'test'
        click_button 'Create Picture'
        expect(page).to have_content 'error'
      end
    end

    context 'editing pictures' do

      scenario 'lets a user edit their own pictures' do
        new_picture
        visit '/pictures'
        click_link 'edit'
        fill_in 'Name', with: 'new name'
        click_button 'Update Picture'
        expect(page).to have_content 'new name'
        expect(current_path).to eq '/pictures'
      end

      scenario 'stops a user editing other peoples pictures' do
        Picture.create(name:'another test',
                       avatar_file_name: 'test.jpg',
                       avatar_file_size: '10',
                       avatar_content_type: 'image/jpeg')
        visit '/pictures'
        click_link 'edit'
        expect(page).to have_content 'You did not add that picture'
      end
    end

    context 'deleting pictures' do

      scenario 'lets a user delete their own picture' do
        new_picture
        visit '/pictures'
        click_link 'delete'
        expect(page).not_to have_content 'test'
        expect(page).to have_content 'Picture deleted successfully'
      end

      scenario 'stops a user deleting other peoples pictures' do
        Picture.create(name:'another test',
                       avatar_file_name: 'test.jpg',
                       avatar_file_size: '10',
                       avatar_content_type: 'image/jpeg')
        visit '/pictures'
        click_link 'delete'
        expect(page).to have_content 'You did not add that picture'
      end
    end

    def sign_up
      visit '/pictures'
      click_link 'Sign up'
      fill_in 'Email', with: 'test@makers.com'
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'
      click_button 'Sign up'
    end

    def new_picture
      visit '/pictures'
      click_link 'Add a picture'
      attach_file 'Avatar', 'spec/features/test.jpg'
      fill_in 'Name', with: 'test'
      click_button 'Create Picture'
    end
  end
end
