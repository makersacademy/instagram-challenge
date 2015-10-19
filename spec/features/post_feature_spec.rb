require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a new post'
    end
  end
end

context 'creating posts' do
  scenario 'prompts user to fill out a form, then displays the new restaurant' do
    visit '/posts'
    click_link 'Add a post'
    fill_in 'Name', with: 'Bird'
    click_button 'Create post'
    expect(page).to have_content 'Bird'
    expect(current_path).to eq '/posts'
  end
end

context 'viewing posts' do

  let!(:bird){Restaurant.create(name:'Bird')}

  scenario 'lets a user view a post' do
   visit '/posts'
   click_link 'Bird'
   expect(page).to have_content 'Bird'
   expect(current_path).to eq "/posts/#{bird.id}"
  end
end

context 'editing posts' do

  before { Post.create name: 'Bird' }

  scenario 'let a user edit a post' do
   visit '/posts'
   click_link 'Edit Bird'
   fill_in 'Name', with: 'Fish'
   click_button 'Update Post'
   expect(page).to have_content 'Fish'
   expect(current_path).to eq '/posts'
  end

end

context 'deleting posts' do

  before {Post.create name: 'Bird'}

  scenario 'removes a post when a user clicks a delete link' do
    visit '/posts'
    click_link 'Delete Bird'
    expect(page).not_to have_content 'Bird'
    expect(page).to have_content 'Post deleted successfully'
  end

end
