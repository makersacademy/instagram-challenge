require 'rails_helper'

feature 'Dogs' do
  context 'no posts have been added' do
    scenario 'should display a prompt to post a photo' do
      visit 'posts/index'
      expect(page).to have_content 'No dogs yet'
      expect(page).to have_link 'Post a photo'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(title: 'Poppy')
    end
    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('Poppy')
      expect(page).not_to have_content('No dogs yet')
    end
  end
end
  context 'viewing dogs' do

    let!(:poppy){ Post.create(title:'Poppy')}

    scenario 'lets a user view a post' do
      visit '/posts'
      click_link 'Poppy'
      expect(page).to have_content 'Poppy'
      expect(current_path).to eq "/posts/#{poppy.id}"
    end
end

  context 'editing dogs' do
    before { Post.create title: 'Poppy', desc: "Mellow retriever", id: 1}
    scenario 'let a user edit a post description' do
      visit '/posts'
      click_link 'Edit Poppy'
      fill_in 'Title', with: 'Alphi'
      fill_in 'post_desc', with: 'gentle giant'
      click_button 'Update Post'
      click_link 'Alphi'
      expect(page).to have_content 'Alphi'
      expect(page).to have_content 'gentle giant'
      expect(current_path).to eq '/posts/1'
    end
  end
