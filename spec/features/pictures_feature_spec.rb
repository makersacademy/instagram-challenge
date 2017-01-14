require 'rails_helper'

feature 'restaurants' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'pictures have been added' do
    before do
      create_picture
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content('This is my cat')
      expect(page).not_to have_content('No pictures yet')
    end
  end

  context 'posting pictures' do
    scenario 'user uploads images and writes caption, then the post is displayed' do
      create_picture
      page.has_image?(src: './public/cat.png', alt: 'picture')
      expect(page).to have_content('This is my cat')
    end
  end

  # context 'viewing posts' do
  #   let!(:cat_pic){ Picture.create(image: './public/cat.png', caption: 'This is my cat') }
  #     scenario 'lets a user view a post in full' do
  #       visit '/pictures'
  #       click_link 'picture'
  #       expect(page).to have_content 'This is my cat'
  #       expect(current_path).to eq '/pictures/#{cat_pic.id}'
  #     end
  # end

  # context 'editing posts' do
  #   before { create_picture }
  #   scenario 'let a user edit a post' do
  #     visit '/pictures'
  #     click_link 'Edit Picture'
  #   end
  # end
end
