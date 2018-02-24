require 'rails_helper'

feature 'Editing posts' do
  background do
    create(:post)
    user = create(:user)
    sign_in user
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end

  scenario 'Can edit a post' do
    fill_in 'Description', with: 'This is probably a mistake'
    click_button 'Update Post'

    expect(page).to have_content('Post updated')
    expect(page).to have_content('This is probably a mistake')
  end

  it 'user tries to upload something that is not an image' do
    attach_file('Image', 'spec/images/wrong.zip')
    click_button 'Update Post'

    expect(page).to have_content('Something is wrong with your form!')
  end
end
