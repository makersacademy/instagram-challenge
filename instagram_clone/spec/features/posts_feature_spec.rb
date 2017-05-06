require 'rails_helper'

describe 'Post' do
  context 'has been added' do
    before do
      Post.create(description: "A photo")
    end

    # scenario 'display posts' do
    #   visit('/')
    #   expect(page).to have_content('A photo')
    # end
  end

  context 'create new post' do
    scenario 'displays a create new post -form if user is logged in' do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: "mail@magnusholm.com")
      fill_in('Password', with: "123banana")
      fill_in('Password confirmation', with: "123banana")
      click_button('Sign up')
      click_link('New post')
      expect(page).to have_current_path('/posts/new')
    end
  end
end
