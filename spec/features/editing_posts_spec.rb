require 'rails_helper.rb'

feature 'Editing posts' do
  background do
    user = create(:user)
    post_one = create(:post, caption: "This is post one", user_id: user.id)

    sign_in_with user

    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end

  scenario 'can edit a post' do
    fill_in 'post[caption]', with: "I've just changed this!"
    click_button 'Update Post'
    expect(page).to have_content('Post updated')
    expect(page).to have_content("I've just changed this!")
  end

  scenario 'recieve an error message if an image is not included' do

    attach_file('post[image]', 'spec/files/misc.txt')
    click_button 'Update Post'
    expect(page).to have_content('Please ensure an image is posted')
  end

  scenario 'edit option not visible on other users posts' do
    click_link 'Log Out'
    user2 = create(:user, username: "Dave", email: 'as@email.com', password: "123456", password_confirmation: "123456", id: 2)
    sign_in_with user2
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page).to_not have_content('Edit Post')
  end

  scenario 'can\'t edit posts via the direct path' do
    click_link 'Log Out'
    user2 = create(:user, username: "Dave", email: 'as@email.com', password: "123456", password_confirmation: "123456", id: 2)
    sign_in_with user2
    visit '/posts/1/edit'
    expect(page.current_path).to eq root_path
    expect(page).to have_content("Unable to edit other users posts")
  end

end
