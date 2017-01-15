require 'rails_helper'

feature 'posts' do

  context 'no posts have been made' do
    scenario 'should display a prompt to make a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(caption: 'The snow looks great')
    end

    scenario 'display restaurants' do
      visit '/posts'
      expect(page).to have_content('The snow looks great')
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Caption', with: 'The snow looks good'
      click_button 'Create Post'
      expect(page).to have_content 'The snow looks good'
      expect(current_path).to eq '/posts'
    end
  end

  context 'viewing posts' do

    let!(:cake){ Post.create(caption:'Cake') }

    scenario 'lets a user view a post' do
      visit '/posts'
      click_link 'Cake'
      expect(page).to have_content 'Cake'
      expect(current_path).to eq "/posts/#{cake.id}"
    end

  end
end
