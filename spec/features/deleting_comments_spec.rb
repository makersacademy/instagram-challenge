require 'rails_helper'

feature 'Deleting comments' do
  background do
    user = create :user
    user2 = create(:user, id: 2, email: 'example@email.com', username: 'sampleuser')
    post = create :post
    comment = create(:comment, user_id: user2.id, post_id: post.id)
    sign_in user2
  end

  scenario 'user can delete their own comments' do
    visit '/'

    expect(page).to have_content('MyText')

    click_link 'delete-1'

    expect(page).to_not have_content('MyText')
  end
end
