require 'rails_helper'

RSpec.feature 'Like' do
  scenario 'user can like a picture' do
    log_in_test_user
    fill_in ('post[message]'), with: 'A message'
    attach_file('post[picture]', 'spec/features/ruby_img.png')
    click_button('Submit')
    click_link('Logout')
    log_in_test_user_2
    within('.post') do
      click_button('Like')
      expect(page.find('.count-like')).to have_content '1'
    end
  end

  scenario 'user can dislike a picture' do
    log_in_test_user
    fill_in ('post[message]'), with: 'A message'
    attach_file('post[picture]', 'spec/features/ruby_img.png')
    click_button('Submit')
    click_link('Logout')
    log_in_test_user_2
    within('.post') do
      click_button('Like')
      click_button('Dislike')
      expect(page.find('.count-like')).to have_content '0'
    end
  end
end
