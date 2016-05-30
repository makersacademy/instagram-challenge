require 'rails_helper'
require 'web_helper'

feature 'posts' do
  before(:each) {
    Post.delete_all
    create_account_and_sign_in
  }
  image = File.new(File.expand_path('./spec/features/test.png'))

  context 'no posts should have been added' do
    scenario 'should display a promp to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end
  context 'posts have been added' do
    before do
      Post.create(title:'TEST', image:image, tag:'tagged')
    end
    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('TEST')
      expect(page).not_to have_content('No posts')
    end
  end
  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the post' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Title', with: 'TEST'
      fill_in 'Tag', with: 'tagged'
      page.attach_file('Image', File.expand_path('./spec/features/test.png'))
      click_button 'Create Post'
      expect(page).to have_content('TEST')
      expect(current_path).to eq '/posts'
    end
  end
  context 'viewing posts' do
    let!(:test_image) {Post.create(title:'TEST', image:image, tag:'tagged')}
    scenario 'viewing a single post' do
      visit '/posts'
      click_link 'TEST'
      expect(page).to have_content('TEST')
      expect(page).to have_content('tagged')
      expect(page).to have_content('Likes: 0')
      expect(current_path).to eq "/posts/#{test_image.id}"
    end
  end
  context 'liking posts' do
    let!(:test_image){Post.create(title:'TEST', image:image, tag:'tagged')}
    scenario 'liking a post increases it\'s like count' do
      visit '/posts'
      click_button 'like'
      click_link 'TEST'
      expect(page).to have_content('Likes: 1')
      expect(current_path).to eq "/posts/#{test_image.id}"
    end
  end
  context 'editing posts' do
    before {Post.create(title:'TEST', image:image, tag:'tagged')}
      scenario 'posts can be edited' do
        visit '/posts'
        click_link 'Edit TEST'
        fill_in 'Title', with: 'CHANGED TEST'
        fill_in 'Tag', with: 'retagged'
        click_button 'Update Post'
        expect(page).to have_content('CHANGED TEST')
        expect(page).to have_content('retagged')
        expect(current_path).to eq '/posts'
      end
  end
  context 'deleting posts' do
    before {Post.create(title:'TEST', image:image, tag:'tagged')}
      scenario 'posts can be deleted' do
        visit '/posts'
        click_link 'Delete TEST'
        expect(page).not_to have_content('TEST')
        expect(page).not_to have_content('tagged')
        expect(current_path).to eq '/posts'
      end
  end
  context 'an invalid post' do
    scenario 'does not let you submit a title that is too short' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Title', with: 'MA'
      fill_in 'Tag', with: 'too_short'
      page.attach_file('Image', File.expand_path('./spec/features/test.png'))
      click_button 'Create Post'
      expect(page).not_to have_content('MA')
      expect(page).not_to have_content('too_short')
      expect(page).to have_content 'error'
    end
  end
end
