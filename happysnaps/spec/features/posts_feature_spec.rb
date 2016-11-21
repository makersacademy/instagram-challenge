require 'rails_helper'

feature 'happysnaps posts' do
  context 'no posts have been added' do
    scenario 'should show a prompt to add a picture' do
      visit '/posts'
         expect(page).to have_content 'No posts yet'
        expect(page).to have_link 'Add a post'
    end
  end

  context 'added posts' do
    before do
      Post.create(caption: 'Yum!')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('Yum!')
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'creating posts' do
    scenario 'option for user to upload a photo and write a caption' do
      visit '/posts/new/'
      attach_file('post_image', '/Users/annalucking/Desktop/amelie.png')
      fill_in 'post_caption', with: 'Check it out!'
      click_button 'Add post'
      expect(page).to have_content 'Check it out!'
      expect(current_path).to eq '/posts'
    end
  end

  # context 'viewing posts' do
  #   let!(:/posts/1){Post.create(image: post.image.url)}
  #   scenario 'lets a user see a post' do
  #     visit '/posts'
  #     click_link '/posts/1'
  #     expect(current_path).to eq '/posts/#{image.url.id}'
  #   end
  # end

  context 'updating posts' do
    scenario 'lets user edit a post' do
      visit '/posts'
      click_link('Edit Post')
      attach_file('post_image', '/Users/annalucking/Desktop/amelie.png')
      fill_in 'post_caption', with: 'Check it out!'
      click_button 'Update post'
      expect(page).to have_content 'Check it out!'
      expect(current_path).to eq '/posts'
    end
  end

  context 'delete posts' do
    before do
      Post.create(caption: 'Yum!')
    end
    scenario 'lets users delete posts' do
      visit '/posts'
      click_link('Delete Post')
      expect(page).not_to have_content('Yum!')
    end
  end
end
