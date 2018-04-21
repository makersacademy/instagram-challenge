require 'rails_helper'

feature 'Deleting comments' do
  background do
    user = create :user
    user_two = create(:user, id: 2,
                             email: 'usertwo@gmail.com',
                             username: 'usertwo')
    post = create :post
    comment = create(:comment, user_id: user_two.id,
                               post_id: post.id)
    comment_two = create(:comment, id: 2, user_id: user.id,
                                   post_id: post.id,
                                   content: 'This should not be deleted')
    sign_in_with user_two
  end
  scenario 'user can delete their own comments' do
    visit '/'
    expect(page).to have_content('MyText')
    click_link 'delete-1'
    expect(page).to_not have_content('MyText')
  end
  scenario 'user cannot delete a comment not belonging to them via the ui' do
    visit '/'
    expect(page).to have_content('This should not be deleted')
    expect(page).to_not have_css('#delete-2')
  end
end
