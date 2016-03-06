require 'rails_helper'

feature 'Posts feature' do

  context 'creating posts' do

    scenario 'user fills in a form, then displays the new post' do
      visit('/')
      click_link 'New post'
      attach_file('Image', "spec/files/images/first.jpg")
      fill_in 'Caption', with: 'Lorem ipsum dolor sit amet.'
      click_button 'Create Post'
      expect(page).to have_content('Lorem ipsum dolor sit amet.')
      expect(page).to have_css("img[src*='first.jpg']")
    end

    scenario 'not saving new post without image' do
      visit('/')
      click_link 'New post'
      fill_in 'Caption', with: 'Lorem ipsum dolor sit amet.'
      click_button 'Create Post'
      expect(page).not_to have_content('Lorem ipsum dolor sit amet.')
      expect(page).to have_content 'error'
    end

  end

  context 'viewing posts' do

    let!(:post1){Post.create(
                        image: File.open("#{Rails.root}/spec/files/images/first.jpg"),
                        caption: 'First post')}

    let!(:post2){Post.create(
                        image: File.open("#{Rails.root}/spec/files/images/second.jpg"),
                        caption: 'Second post')}

    scenario 'let a user view posts' do
      visit '/'
      expect(page).to have_content 'First post'
      expect(page).to have_css("img[src*='first.jpg']")
      expect(page).to have_content 'Second post'
      expect(page).to have_css("img[src*='second.jpg']")
    end

    scenario 'let a user view individual post' do
      visit '/'
      click_link 'View First post'
      expect(page).to have_content 'First post'
      expect(page.current_path).to eq(post_path(post1))
    end

  end

  context 'editing posts' do

    let!(:post1){Post.create(
                        image: File.open("#{Rails.root}/spec/files/images/first.jpg"),
                        caption: 'First post')}


    scenario 'let a user edit a post' do
      visit '/'
      click_link 'View First post'
      click_link 'Edit'
      fill_in 'Caption', with: 'First POST'
      click_button 'Update Post'
      expect(page).to have_content 'First POST'
      expect(current_path).to eq(post_path(post1))
    end

    scenario 'not saving updates for post without image' do
      visit('/')
      click_link 'View First post'
      click_link 'Edit'
      fill_in 'Caption', with: 'Something new.'
      attach_file('Image',"spec/files/images/first.txt")
      click_button 'Update Post'
      expect(page).not_to have_content('Something new.')
      expect(page).to have_content 'error'
    end
  end

  context 'deleting posts' do
    let!(:post1){Post.create(
                        image: File.open("#{Rails.root}/spec/files/images/first.jpg"),
                        caption: 'First post')}

    scenario 'delete a post when user press Delete button' do
      visit '/'
      click_link 'View First post'
      click_link 'Edit'
      click_link 'Delete'
      expect(current_path).to eq('/')
      expect(page).to have_content 'Post deleted successfully'
      expect(page).not_to have_content 'First post'
    end

  end

end
