require 'rails_helper'

feature 'Post' do

  scenario 'there are no posts until a first one has been created' do
    visit '/posts'
    expect(page).to have_content('No posts yet :-(')
    expect(page).to have_link('add a post!')
  end

  scenario 'a user can view a post' do
    post = Post.create(name: 'Poast', content: 'its a post')
    visit '/posts'
    click_link "Poast"
    expect(page).to have_content 'its a post'
    expect(current_path).to eq "/posts/#{post.id}"
  end

  scenario 'post cannot be made by a visitor' do
    visit '/posts'
    click_link 'add a post!'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  scenario 'theres a link to make a post on the front page' do
    visit '/'
    expect(page).to have_link 'add a post!'
  end


  context 'signed up and post made' do

    before(:each) do
      sign_up
      make_post
    end

    scenario 'when the user fills out the post form, the post is now displayed' do
      expect(page).to have_content 'moar poasts!!!!'
      expect(current_path).to eq '/posts'
    end

    scenario 'posts display the name of who created them' do
      expect(page).to have_content 'test@example.com'
    end

    context 'deleting a post' do
      scenario 'can be done by the user who made it' do
        visit '/posts'
        click_link "Poast"
        click_link "delete post"
        expect(page).to have_content('Post deleted successfully')
        expect(page).not_to have_content('its a post')
      end

      scenario 'and not by someone else' do
        click_link 'Sign out'
        sign_up 'differentuser@test.com'
        visit '/posts'
        click_link "Poast"
        click_link "delete post"
        expect(page).to have_content('Only the author can delete posts')
        expect(page).to have_content 'Poast'
      end
    end
  end
  context 'uploading an image' do
    scenario 'can upload an image' do
      sign_up
      visit '/posts'
      click_link 'add a post!'
      fill_in :Name, with: 'Poast'
      attach_file('post_image', 'spec/testcat.jpg')
      fill_in :Content, with: 'content'
      click_button 'Create Post'
      click_link 'Poast'
      expect(page).to have_xpath("//img[@alt='Testcat']")
    end
  end

end