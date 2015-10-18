require 'rails_helper'

feature 'commenting' do

  before do
    user = create :user
    sign_in_as(user)
    add_picture('spec/assets/images/dism.jpg')
  end

  scenario 'allows users to leave a comment using a form' do
    leave_comment('Wow!')
    expect(current_path).to eq '/pictures'
    expect(page).to have_content('Wow!')
  end

  scenario 'user should be able to delete comment' do
    leave_comment('WOW!')
    click_link 'x'
    expect(page).not_to have_content 'WOW!'
  end

  scenario 'user can not delete another user\'s comment' do
    leave_comment('Nice!')
    click_link 'Sign out'
    user2 = create(:user, email: 'test2@example.com')
    sign_in_as(user2)
    expect(page).to have_content 'Nice!'
    expect(page).not_to have_link 'x'
  end

end