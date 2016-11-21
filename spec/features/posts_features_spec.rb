require 'rails_helper'

feature 'posts' do
  context 'no posts have been made yet' do
    it 'does not show posts if none have been made' do
      sign_up
      visit '/posts'
      expect(page).to have_link('Chuck up a photo')
      expect(page).to have_content('no posts yet mate!')
    end
  end
  it 'shows posts on homepage' do
    Post.create(caption: 'This is my caption baby!!')
    sign_up
    expect(page).to have_content('This is my caption baby!!')
  end
  it 'allows users to create new posts' do
    sign_up
    click_link 'Chuck up a photo'
    fill_in('Caption', with: 'This is my caption!')
    click_button('Create Post')
    expect(page).to have_content('This is my caption!')
  end

  it 'allows users to edit posts' do
    sign_up
    click_link('Chuck up a photo')
    fill_in('Caption', with: 'Here is a post')
    click_button('Create Post')
    click_link 'Edit'
    fill_in('Caption', with: 'My edited caption')
    click_button('Update Post')
    expect(page).to have_content('My edited caption')
  end

  it 'allows users to delete posts' do
    sign_up
    click_link('Chuck up a photo')
    fill_in('Caption', with: 'Here is a post')
    click_button('Create Post')
    click_link 'Delete'
    expect(page).to_not have_content('Here is a post')
  end
end
