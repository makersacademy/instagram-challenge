require 'rails_helper'

feature 'Edit your post' do
  background do
    user = sign_in_as_valid_user
    post = create(:post, user_id: user.id)
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/#{post.id}')]").click
    click_link 'Edit Post'
  end

  scenario 'edit the post' do
    fill_in :text, with: '*edited post*'
    click_button 'Update Post'

    expect(page).to have_content('Post updated.')
    expect(page).to have_content('*edited post*')
  end

  # it 'will not post if file is not an image' do
  #   attach_file(:image, 'spec/files/images/test_img_1.zip')
  #
  #   click_button 'Update Post'
  #   expect(page).to have_content('Something is wrong with your form!')
  # end
end

feature 'Edit another users post' do
  background do
    user_1 = create(:user, email: 'test1@test.com', user_name: 'testuser1')
    user_2 = create(:user, email: 'test2@test.com', user_name: 'testuser2')
    post = create(:post, user_id: user_1.id)
    sign_in_as_user(user_2)
    visit "/posts/#{post.id}/edit"
  end

  scenario 'A user can not edit another users post' do
    expect(page).to have_content("That post doesn't belong to you!")
  end
end
