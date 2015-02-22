feature 'Comments' do
  context 'When viewing a post' do

    before do
      sign_up_and_in
      create_post('capybara.jpg')
      click_link 'Capybara'
    end

    scenario 'Has no comments by default' do
      expect(page).to have_content 'No comments'
      expect(page).to have_link 'Add a comment'
    end

    scenario 'Comments can be created from the posts page' do
      click_link 'Add a comment'
      fill_in 'Comment', with: 'Cool capybara!'
      click_button 'Add Comment'

      expect(page).to have_content 'Cool capybara!'
      expect(page).not_to have_content 'No comments'
    end

  end
end