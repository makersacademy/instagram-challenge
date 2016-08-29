require 'rails_helper'

feature 'Instagramclone posts' do
  context 'no posts yet' do
    scenario 'should display button for new posts' do
      visit '/'
      expect(page).to have_link 'New Post'
    end
  end
end

feature 'Posts' do
  scenario 'create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('post_image', "spec/images/thumb.png")
    fill_in 'Caption', with: 'thumbs up #thumb'
    click_button 'Create Post'
    expect(page).to have_content('#thumb')
  end

  scenario 'image required to create a post' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: "No picture added"
    click_button 'Create Post'
    expect(page).to have_content('Image can\'t be blank Caption')
  end

  scenario 'delete a post' do
    visit '/'
    click_link 'New Post'
    attach_file('post_image', "spec/images/thumb.png")
    fill_in 'Caption', with: 'This is #thumbs123'
    click_button 'Create Post'
    expect(page).to have_content('#thumbs123')
    click_link 'Delete'
    expect(page).not_to have_content('#thumbs123')
  end

end
