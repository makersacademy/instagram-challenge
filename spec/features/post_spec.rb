require 'rails_helper'

RSpec.feature 'Post' do
  scenario 'user can post a picture' do
    log_in_test_user
    fill_in ('post[message]'), with: 'A message'
    attach_file('post[picture]', 'spec/features/ruby_img.png')
    click_button('Submit')
    expect(page.find('img')[:src]).to include 'ruby_img.png'
  end
end
