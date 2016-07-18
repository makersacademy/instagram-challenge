require 'rails_helper'
require 'helpers/web_helper'

feature 'posting pictures' do

  before do
    sign_up
    post_pic
  end

  scenario 'post a picture' do
    expect(Post.first).to have_attached_file(:pic)
  end

  scenario 'view pic stream' do
    expect(page).to have_content 'A lovely cat'
  end

  scenario 'view specific post' do
    find(:xpath, "//a[@href='/posts/1']").click
    expect(page).to have_content 'A lovely cat'
  end

  scenario 'can delete post' do
    find(:xpath, "//a[@href='/posts/1']").click
    click_link 'Delete post'
    expect(Post.all).to be_empty
  end

end
