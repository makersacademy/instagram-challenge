feature 'Posts' do
  scenario 'leave a comment for a post' do
    sign_up
    create_new_post
    click_link "show_image"
    click_link 'Comment'
    fill_in 'Comment', with: 'Very nice'
    click_button 'Submit'
    expect(page).to have_content('Very nice')
  end
end
