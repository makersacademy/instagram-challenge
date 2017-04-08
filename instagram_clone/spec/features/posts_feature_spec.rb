feature 'Post' do
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
      expect(current_path).to eq "/posts"
    end
  end
end
