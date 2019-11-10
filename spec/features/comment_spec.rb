require 'rails_helper'

RSpec.feature 'Comment' do
  scenario 'user can comment a picture' do
    log_in_test_user
    fill_in ('post[message]'), with: 'A message'
    attach_file('post[picture]', 'spec/features/ruby_img.png')
    click_button('Submit')
    click_link('Logout')
    log_in_test_user_2
    within('.new_comment') do
      fill_in ('comment[message]'), with: 'A comment'
      click_button('Add comment')
    end
    expect(page).to have_content 'A comment'
  end
end
