feature 'cannot create a post without image' do
  scenario 'must submit image to create a post' do
    visit '/'
    click_link 'New Post'
    fill_in 'post[description]', with: 'me and my sweet kids'
    click_button 'submit'
    expect(page).not_to have_content('me and my sweet kids')
    expect(page).to have_content('Please attach your image to post')
  end
end
