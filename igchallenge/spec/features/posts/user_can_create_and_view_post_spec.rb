feature 'creating and viewing posts' do
  scenario 'a user can create and view their post' do
    sign_up
    click_link 'Post a new picture'
    fill_in 'post[description]', with: "Test Post Please Ignore"
    attach_file('post[image]', 'public/test.jpeg')
    click_button 'Create Post'

    expect(page).to have_content "Test Post Please Ignore"
  end
end
