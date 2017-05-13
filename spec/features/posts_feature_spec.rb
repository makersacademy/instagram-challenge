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
      sign_up
      click_link('New post')
      expect(page).to have_current_path('/posts/new')
    end
    scenario 'displays a success message on the post page after uploading image' do
      sign_up
      click_link('New post')
      fill_in('Description', with: 'hi')
      attach_file('Image', Rails.root + 'spec/images/monkeyselfie.jpeg')
      click_button('Create Post')
      expect(page).to have_content('Success')
      # expect(page).to have_xpath('//img[@src="/spec/images/monkeyselfie.jpeg"]')
    end
  end
end
