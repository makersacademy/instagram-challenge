require 'rails_helper'

feature 'Comments' do

  context 'adding comments to a post' do

    it 'signed in users can add comments to any post' do
      visit '/'
      click_link 'Sign up'
      fill_in 'Email', with: "test@hotmail.com"
      fill_in 'Password', with: "123456"
      fill_in 'Password confirmation', with: "123456"
      click_button 'Sign up'
      expect(page).to(have_link("Add post"))
      click_link 'Add post'
      page.attach_file 'photo_image', "spec/images/toffee.jpg"
      fill_in 'Caption', with: 'Amazing doggie #toffee'
      click_button 'Create Photo'
      expect(page).to have_content 'Amazing doggie #toffee'
      expect(page).to have_link('Comment')
    end

    it 'logged out user cannot comment on any posts' do
      visit '/photos'
      expect(page).not_to(have_link('Comment'))
    end
  end
end
