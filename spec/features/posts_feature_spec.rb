require 'rails_helper'

feature 'Dogs' do
  context 'no posts have been added' do
    scenario 'should display a prompt to post a photo' do
      visit 'posts/index'
      expect(page).to have_link 'Post a photo'
    end

    scenario 'should tell user there are no dogs to view' do
      visit 'posts/index'
      expect(page).to have_content 'No dogs yet'
    end
end

  end

  context 'posts have been added' do
    before do
      Post.create(title: 'Poppy')
      Post.create(title: 'Freddie')
    end
    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('Poppy')
      expect(page).not_to have_content('No dogs yet')
    end
    xscenario 'cannot be added if already a post with that title' do
      visit '/posts'
      post = Post.create(title: 'Freddie')
      expect(page).to have_content('Freddie')
      expect(post).to have_content(error)
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
      sign_up
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

  context 'deleting dogs' do
     before { Post.create title: 'Poppy', desc: "Mellow retriever" }

     scenario 'removes a post when a user clicks a delete link' do
       sign_up
       visit '/posts'
       click_link 'Delete Poppy'
       expect(page).not_to have_content 'Poppy'
       expect(page).to have_content 'Post deleted successfully'
     end
  end
