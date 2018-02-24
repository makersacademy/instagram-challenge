require 'rails_helper'

feature 'Creating Comments' do
  scenario 'can comment on an existing post' do
    user = create(:user)
    post = create(:post, user_id: user.id)
    sign_in user
    visit '/'
    fill_in 'comment[content]', with: 'this is sublime'
    click_button 'Leave Comment'

    expect(page).to have_css("div.comments#{post.id}", text: 'this is sublime')
  end
end
