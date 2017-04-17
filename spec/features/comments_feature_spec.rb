require 'rails_helper'

feature 'Comments' do
  scenario 'allows users to comment on posts' do
    create(:post)
    visit '/posts'
    click_link 'Add Comment'
    fill_in 'Thoughts', with: 'I agree'
    click_button 'Leave Comment'
    expect(current_path).to eq('/posts')
    expect(page).to have_content('I agree')
  end

  context 'deleting comments' do
    before do
      user = build(:user)
      sign_up_as(user)

      visit '/posts'
      click_link 'Add a post'
      fill_in 'Caption', with: 'Nah nah nah'
      attach_file 'post[image]', 'spec/asset_spec/images/testing.png'
      click_button 'Upload'
      click_link 'Add Comment'
      fill_in 'Thoughts', with: "That's nice"
      click_button 'Leave Comment'
    end

    scenario 'only creators can delete comments' do
      visit '/posts'
      click_link 'Delete Comment'
      expect(page).not_to have_content('#life')
    end

    scenario 'non-creators cannot delete comments' do
      click_link 'Sign out'
      user2 = build(:user, email: 'testing@testing.com', username: 'potato')
      sign_up_as(user2)
      visit '/posts'
      click_link 'Delete Comment'
      expect(page).to have_content('Only the user who commented can delete this comment')
    end
  end
end
