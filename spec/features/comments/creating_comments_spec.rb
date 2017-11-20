require 'rails_helper'

feature 'Creating comments' do
  user = []
  background do
    user = sign_in_as_valid_user
    create_post_visit_route(user) { |post|
      find(:xpath, "//a[contains(@href,'posts/#{post.id}')]").click
    }
  end

  scenario 'can create a comment' do
    fill_in 'content', with: 'Great post'
    click_button 'Comment'
    # expect(page).to have_content('Great post')
    expect(page).to have_content("#{user.user_name.capitalize}: Great post")
  end

  # it 'needs an image to create a post' do
  #   click_button 'Create Post'
  #   expect(page).to have_content('Something is wrong with your form!')
  # end
end