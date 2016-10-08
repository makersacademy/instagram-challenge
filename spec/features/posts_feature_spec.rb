require 'rails_helper'

feature 'posts' do
    context 'no posts have been added' do
      scenario 'no posts displayed' do
        visit '/posts'
        expect(page).to have_content 'No posts yet'
        expect(page).to have_link 'Upload a photo'
      end
    end

    context 'creating a post' do
      scenario 'clicking link to create post' do
        visit '/posts'
        click_link 'Upload a photo'
        expect(current_path).to eq '/posts/new'
      end

      scenario 'uploading a photo' do
        visit '/posts'
        click_link 'Upload a photo'
        attach_file('Upload', "spec/files/images/cat.jpg")
        click_button 'Create Post'
        expect(page).to have_css("ims sg[src*='cat.jpg']")
      end
    end

    context 'viewing posts' do
      let!(:cat){Post.create(image_file_name: 'cat.jpg')}
      scenario 'Clicking full shows the post' do
        visit '/posts'
        click_link 'full'
        expect(current_path).to eq "/posts/#{cat.id}"
        expect(page).to have_content 'cat.jpg'
      end

    end
  end
