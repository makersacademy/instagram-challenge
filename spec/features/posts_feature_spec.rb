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

context 'posts have been added' do
  before(:each) do
  user1 = User.create! :email => "aa@bb.com", :password => 'topsecret', :password_confirmation => 'topsecret'
  post = Post.create! :title => 'DeeDee', :desc=> 'Foxy Jack Russell with attitude', :user_id=> user1.id
  end

  scenario 'display posts' do
    visit '/posts'
    expect(page).to have_content('DeeDee')
    expect(page).not_to have_content('No dogs yet')
  end

  scenario 'cannot be added if already a post with that title' do
    sign_up
    expect(page).to have_content('signed up successfully.')
    expect(page).to have_content('DeeDee')
    click_link 'Post a photo'
    fill_in 'post_title', with: 'DeeDee'
    fill_in 'post_desc', with: 'Foxy'
    click_button 'Create Post'
    expect(page).to have_content('Error :Post not created')
  end

  scenario 'cannot add post when signed out' do
    visit '/posts'
    click_link 'Post a photo'
    expect(page).to have_content('You need to sign in or sign up before continuing')
  end
end

context 'viewing dogs' do

    let!(:freddie){ Post.create(title: 'Freddie', desc: 'Handsome', user_id: 1)}

  scenario 'lets a user view a specific post on its own tab' do
    sign_up
    click_link 'Post a photo'
    fill_in 'post_title', with: 'Freddie'
    fill_in 'post_desc', with: 'handsome'
    click_button 'Create Post'
    p Post.last.id
    click_link 'Freddie'
    expect(page).to have_content 'Freddie'
    expect(current_path.last(3)).to eq((Post.last.id).to_s)
  end
end

context 'editing dogs' do
      before do
      user1 = User.create! :email => "doglover@gmail.com", :password => 'topsecret', :password_confirmation => 'topsecret'
      Post.create!(title: 'Poppy', desc: "Mellow retriever", user_id: user1.id)
      end
    scenario 'let a user edit a post description' do
      sign_in
      visit '/posts'
      click_link 'Edit Poppy'
      fill_in 'post[title]', with: 'Alphi'
      fill_in 'post[desc]', with: 'gentle giant'
      click_button 'Update Post'
      click_link 'Alphi'
      expect(page).to have_content 'Alphi'
      expect(page).to have_content 'gentle giant'
      expect(current_path.last(3)).to eq((Post.last.id).to_s)
    end

    # xscenario 'user can only edit their own post' do
    #   sign_up
    #   visit '/posts'
    #   click_link 'Edit Poppy'
    #   fill_in 'post[title]', with: 'Alphi'
    #   fill_in 'post[desc]', with: 'gentle giant'
    #   click_button 'Update Post'
    #   expect(page).to have_content 'You cannot edit another user\'s post'
    #   sign_out
    #   sign_up2
    #   visit '/posts'
    #   click_link 'Edit Poppy'
    #   fill_in 'Breed', with: 'Countess of Ketton'
    #   click_button 'Update Post'
    #   click_link 'Poppy'
    #   expect(page).to have_content 'Countess of Ketton'
    #   expect(current_path).to eq '/posts/1'
    # end
  end

  context 'deleting dogs' do
    before do
      user1 = User.create! :email => "doglover@gmail.com", :password => 'topsecret', :password_confirmation => 'topsecret'
      user2 = User.create! :email => "aa@bb.com", :password => 'topsecret', :password_confirmation => 'topsecret'
      Post.create!(title: 'Poppy', desc: "Mellow retriever", user_id: user1.id)
      Post.create!(title: 'Alphi', desc: "Mellow retriever", user_id: user2.id)
    end
     scenario 'removes a post when a user clicks a delete link' do
       sign_in
       visit '/posts'
       click_link 'Delete Poppy'
       expect(page).not_to have_content 'Poppy'
       expect(page).to have_content 'Post deleted successfully'
     end

    #  xscenario 'cannot delete another users post' do
    #    sign_in
    #    click_link 'Delete Alphi'
    #    expect(page).to have_content 'You cannot delete another user\'s post'
    #  end
   end
end
