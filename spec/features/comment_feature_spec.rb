feature 'Comments' do
  context 'When viewing a post' do

    scenario 'Has no comments by default' do
      create_post
      click_link 'Capybara'
      expect(page).to have_content 'No comments'
    end

  end
end