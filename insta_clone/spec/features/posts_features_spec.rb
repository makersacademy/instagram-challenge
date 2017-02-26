require 'rails_helper'

feature 'posts' do
    context 'no posts should have been added' do
        scenario 'should display a prompt to add a post' do
            visit '/posts'
            expect(page).to have_content 'No posts yet'
            expect(page).to have_link 'Add a post'
        end
    end
    context 'posts have been added' do
        before do
            Post.create(name: 'Nice Picture',
                        image: File.new(Rails.root + 'app/assets/images/post.png'))
        end

        scenario 'display posts' do
            visit '/posts'
            expect(page).to have_content('Nice Picture')
            expect(page).not_to have_content('No posts yet')
        end
    end
    context 'creating posts' do
        scenario 'prompts user to fill out a form, then displays the new post' do
            visit '/posts'
            click_link 'Add a post'
            fill_in 'Name', with: 'Nice Picture'
            page.attach_file('post_image', Rails.root + 'app/assets/images/post.png')
            click_button 'Create Post'
            expect(page).to have_content('Nice Picture')
            expect(page).to have_css "img[src*='post']"
            expect(current_path).to eq '/posts'
        end
    end
    context 'viewing posts' do
        let!(:post) do
            Post.create(name: 'Nice Picture',
                        image: File.new(Rails.root + 'app/assets/images/post.png'))
        end

        scenario 'lets a user view a post' do
            visit '/posts'
            click_link 'Nice Picture'
            expect(page).to have_content 'Nice Picture'
            expect(page).to have_css "img[src*='post']"
            expect(current_path).to eq "/posts/#{post.id}"
        end
    end
    context 'uploading a picture' do
        scenario 'user can add a picture to the post' do
            visit '/posts'
            click_link 'Add a post'
            fill_in 'Name', with: 'Nice Picture'
            page.attach_file('post_image', Rails.root + 'app/assets/images/post.png')
            click_button 'Create Post'
            expect(page).to have_content('Nice Picture')
            expect(page).to have_css "img[src*='post']"
            expect(current_path).to eq '/posts'
        end
    end
    context 'invalid posts' do
        scenario 'users must add an image' do
            visit '/posts'
            click_link 'Add a post'
            fill_in 'Name', with: 'Nice Picture'
            click_button 'Create Post'
            expect(page).not_to have_content 'Nice Picture'
            expect(page).to have_content "Image can't be blank"
        end
    end

context 'editing posts' do

  before do
    Post.create(name: 'Nice Picture',
                     image: File.new(Rails.root + 'app/assets/images/post.png'))
  end

  scenario 'let a user edit a post' do
    visit '/posts'
    click_link 'Edit'
    fill_in 'Name', with: 'Night Out'
    click_button 'Update'
    expect(page).to have_content  'Night Out'
    expect(page).not_to have_content 'Nice Picture'
    expect(current_path).to eq '/posts'
 end

end

end
