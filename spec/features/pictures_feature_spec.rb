require 'rails_helper'

feature 'Pictures' do

  describe 'no pictures have been added' do
    it 'should display a prompt to add a picture' do
      visit pictures_path
      expect(page).to have_content 'No pictures here 😳'
      expect(page).to have_link 'Add a picture'
    end
  end

  describe 'adding pictures' do
    it 'prompts user to upload a picture, then displays the new picture' do
    visit pictures_path
    click_link 'Add a picture'
    attach_file :picture_image, "./spec/images/succulents.jpg"
    fill_in 'Description', with: '#sweetsucculents'
    click_button 'Post'
    expect(page).to have_content '#sweetsucculents'
    expect(page).to have_css "img[src*=succulents]"
    expect(current_path).to eq pictures_path
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

  describe 'editing pictures' do

  let!(:succulent){ Picture.create(description:'#sweetsucculents', image_file_name: "./spec/images/succulents.jpg") }

    scenario 'let a user edit a post' do
     visit pictures_path
     click_link 'Edit'
     fill_in 'Description', with: '#sexysucculents'
     click_button 'Update'
     expect(page).to have_content '#sexysucculents'
     expect(current_path).to eq pictures_path
    end
  end

  describe 'deleting restaurants' do

  let!(:succulent){ Picture.create(description:'#sweetsucculents', image_file_name: "./spec/images/succulents.jpg") }

    it 'deletes an image and it\'s description' do
      visit pictures_path
      click_link 'Delete'
      expect(page).not_to have_content '#sweetsucculents'
      expect(page).to have_content 'Picture deleted 😔'
    end
  end




end
