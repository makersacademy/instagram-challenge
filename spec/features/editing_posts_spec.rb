require 'rails_helper.rb'

feature 'Editing posts' do
  background do
    user = create(:user, email: 'another@gmail.com', password: "password1", id:4)
    post_one = create(:post, caption: "This is post one")

    sign_in_with user
    
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end

  scenario 'can edit a post' do
    fill_in 'Caption', with: "I've just changed this!"
    click_button 'Update Post'
    expect(page).to have_content('Post updated')
    expect(page).to have_content("I've just changed this!")
  end

  scenario 'recieve an error message if an image is not included' do
    attach_file('Image', 'spec/files/misc.txt')
    click_button 'Update Post'
    expect(page).to have_content('Please ensure an image is posted')
  end
end
