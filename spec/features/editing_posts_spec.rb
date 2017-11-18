require 'rails_helper'

feature 'Edit post' do
  background do
    post = create(:post)
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
