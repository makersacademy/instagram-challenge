require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display prompt add a post' do
      visit posts_path
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(image: File.open("#{Rails.root}/spec/fixtures/cat.png"), description: 'Lovely')
    end

    scenario 'display posts' do
      visit posts_path
      expect(page).to have_css("img[src*= 'cat.png']")
      expect(page).to have_content('Lovely')
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'creating posts' do
    scenario 'promts user to fill out form, then displays post' do
      visit posts_path
      click_link('Add a post')
      fill_in 'Description', with: 'Lovely'
      attach_file('post_image', Rails.root + "spec/fixtures/cat.png")
      click_button('Create Post')
      expect(page).to have_content('Lovely')
      expect(current_path).to eq posts_path
    end
  end

  context 'viewing posts' do

    let!(:description){Post.create(description:'Nice')}

    scenario 'lets user view post' do
      visit posts_path
      click_link('Nice')
      expect(page).to have_content('Nice')
      expect(current_path).to eq post_path(description)
    end
  end

  context 'deleting posts' do
    before { Post.create description: "Nice", image:  File.open("#{Rails.root}/spec/fixtures/cat.png")}

    scenario 'deletes post when delete is clicked' do
      visit posts_path
      click_link 'Delete post'
      expect(page).not_to have_content('Nice')
      expect(page).to have_content('Post deleted successfully')
    end
  end
end
