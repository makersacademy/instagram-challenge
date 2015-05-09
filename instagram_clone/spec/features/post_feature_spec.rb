require 'rails_helper'

feature 'Post' do
  context 'There are no posts until a first one has been created' do
    scenario 'There is a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content('No posts yet :-(')
      expect(page).to have_link('add a post!')
    end
  end

  context 'Posts that have been created are viewable at the /posts link' do
    before {Post.create(content: 'its a post')}
    
    scenario 'Posts are displayed' do
      visit '/posts'
      expect(page).to have_content('its a post')
    end
  end

  context 'A post can be made on the site' do
    # replace this with ajax?
    scenario 'Theres a link to make a post on the front page' do
      visit '/'
      expect(page).to have_link 'add a post!'
    end

    context 'only by a user who is signed in' do
      scenario 'When the user fills out the post form, the post is now displayed' do
        sign_up
        visit '/posts'
        click_link 'add a post!'
        fill_in :Content, with: 'moar poasts!!!!'
        click_button 'Create Post'
        expect(page).to have_content 'moar poasts!!!!'
        expect(current_path).to eq '/posts'
      end

      scenario 'post cannot be made by a visitor' do
        visit '/posts'
        click_link 'add a post!'
        expect(page).to have_content 'You need to sign in or sign up before continuing.'
      end
    end

  end

  scenario 'posts display the name of who created them' do
    sign_up
    visit '/posts'
    click_link 'add a post!'
    fill_in :Content, with: 'moar poasts!!!!'
    click_button 'Create Post'
    expect(page).to have_content 'test@example.com'
  end

  scenario 'let a user view a post' do
    post = Post.create(content: 'its a post')
    visit '/posts'
    click_link "post ##{post.id}"
    expect(page).to have_content 'its a post'
    expect(current_path).to eq "/posts/#{post.id}"
  end


  context 'Deleting a post' do
    scenario 'A post can be deleted' do
      post = Post.create(content: 'its a post')
      sign_up
      visit '/posts'
      click_link "post ##{post.id}"
      click_link "delete post"
      visit '/posts'
      expect(page).not_to have_content('its a post')
    end
  end

end