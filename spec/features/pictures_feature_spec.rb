require 'rails_helper'

feature 'Pictures' do

  let!(:user) { User.create(email: 'sity@pop.com', password: 'secret') }

  describe 'User is signed in' do

    before { sign_in_as(user) }

    context 'no pictures have been added' do
      it 'should display a prompt to add a picture' do
        visit pictures_path
        expect(page).to have_content 'No pictures here 😳'
        expect(page).to have_link 'Add a picture'
      end
    end

    context 'adding pictures' do
      it 'prompts user to upload a picture, then displays the new picture' do
      post_picture
      expect(page).to have_content '#sweetsucculents'
      expect(page).to have_css "img[src*=succulents]"
      expect(current_path).to eq pictures_path
      end

      it 'does not let you post without a picture' do
        visit pictures_path
        click_link 'Add a picture'
        fill_in 'Description', with: '#sweetsucculents'
        click_button 'Post'
        expect(page).to have_content 'error'
      end
    end

    context 'editing pictures' do
      it 'allows a user edit a description they have created' do
        post_picture
        visit pictures_path
        click_link 'Edit'
        fill_in 'Description', with: '#sexysucculents'
        click_button 'Save'
        expect(page).to have_content '#sexysucculents'
        expect(current_path).to eq pictures_path
      end
    end

    context 'deleting pictures' do
      it 'allows a user to delete a post they have created' do
        post_picture
        visit pictures_path
        click_link 'Delete'
        expect(page).not_to have_content '#sweetsucculents'
        expect(page).to have_content 'Picture deleted 😔'
      end
    end
  end

  describe 'User is not signed in' do

    context 'adding pictures' do
      it 'must be signed in in to add a picture' do
      visit pictures_path
      expect(page).not_to have_content 'Add picture'
      end
    end

    context 'editing pictures' do
      it 'should not be able to edit a post that user has not added themselves' do
       visit pictures_path
       expect(page).not_to have_content 'Edit'
      end
    end

    context 'deleting pictures' do
      it 'should not be able to edit a post that user has not added themselves' do
        visit pictures_path
        expect(page).not_to have_content 'Delete'
      end
    end
  end
end


  # context 'viewing pictures' do
  #
  #   let!(:succulent){ Picture.create(description:'#sweetsucculents', image_file_name: "./spec/images/succulents.jpg") }
  #
  #   scenario 'lets a user view a picture' do
  #    visit '/pictures'
  #    find(".picture").click
  #    expect(current_path).to eq "/pictures/#{succulent.id}"
  #   end
  #
  # end
