require 'rails_helper'

feature 'Creating comments' do
  scenario 'can comment on a post that already exists' do
    user = create :user
    post = create(:post, user_id: user.id)
    sign_in_with user

    visit '/'

    fill_in 'Add a comment...', with: 'test comment'
    click_button 'Submit'

    expect(page).to have_css("div#comments_#{post.id}", text: 'test comment')

  end
end
