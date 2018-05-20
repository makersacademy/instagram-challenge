# frozen_string_literal: true

require 'rails_helper'

feature 'Deleting comments' do
  background do
    user = create :user
    user2 = create(:user, id: 2, email: 'example@email.com', username: 'sampleuser')
    post = create :post
    comment = create(:comment, user_id: user2.id, post_id: post.id)
    comment2 = create(:comment, id: 2, post_id: post.id, content: 'second comment')
    sign_in user2
  end

  scenario 'user can delete their own comments' do
    visit '/'

    expect(page).to have_content('MyText')

    click_link 'delete-1'

    expect(page).to_not have_content('MyText')
  end

  scenario 'user cannot delete a comment not belonging to them' do
    visit '/'

    expect(page).to have_content('second comment')
    expect(page).to_not have_css('#delete-2')
  end

  scenario 'user cannot delete a comment not belonging to them via urls' do
   visit '/'

   expect(page).to have_content('second comment')

   page.driver.submit :delete, "posts/1/comments/2", {}

   expect(page).to have_content('MyText')
   expect(page).to have_content('second comment')
 end
end
