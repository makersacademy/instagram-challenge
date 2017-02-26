require 'rails_helper'

feature 'Post' do
  context 'Visit homepage' do
    scenario 'It should display a link to add post' do
      visit '/posts'
      expect(page).to have_content "No post added yet"
      expect(page).to have_link "Add post"
    end
  end

  context 'posts have been added' do
    before do
      Post.create(title:'POST1')
    end
    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('POST1')
      expect(page).not_to have_content('No post added yet')
    end
  end

  context 'creating posts' do
  scenario 'prompts user to fill out a form, then displays the new post' do
    sign_up
    click_link 'Add post'
    fill_in 'Title', with: 'POST1'
    click_button 'Create Post'
    expect(page).to have_content 'POST1'
    expect(current_path).to eq '/posts'
  end
end
  context 'viewing posts' do
    let!(:post){ Post.create(title:'POST1') }
    scenario 'lets a user view a post' do
     visit '/posts'
     sign_up
     click_link 'View Post'
     expect(page).to have_content 'POST1'
     expect(current_path).to eq "/posts/#{post.id}"
    end
  end
end
