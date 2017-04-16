feature 'Posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to post a pic' do
      visit '/posts'
      expect(page).to have_content 'No posts yet!'
      expect(page).to have_link 'New Post'
    end
  end

  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      sign_up
      create_new_post
      expect(page).not_to have_content 'No posts yet!'
      expect(page).to have_content 'Caption content'
      expect(current_path).to eq '/posts'
    end

    scenario 'only users can create posts' do
      visit '/posts'
      click_link 'New Post'
      expect(page).to have_content 'Log in'
    end
  end

  context 'editing posts' do
    # scenario 'let a user edit a post' do
    #   sign_up
    #   create_new_post
    #   visit '/posts'
    #   click_link 'Edit'
    #   fill_in 'Caption', with: 'New caption'
    #   click_button 'Update Post'
    #   click_link 'Show'
    #   expect(page).to have_content 'New caption'
    # end

    scenario 'only users can edit posts' do
      visit '/posts'
      expect(page).not_to have_content 'Edit'
    end
  end
end
