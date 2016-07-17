require 'rails_helper'
require 'helpers/pic_helper'

feature 'posting pictures' do

  scenario 'post a picture' do
    post_pic
    expect(Post.first).to have_attached_file(:pic)
  end

  scenario 'view pic stream' do
    post_pic
    expect(page).to have_content 'A lovely cat'
  end

  scenario 'view specific post' do
    post_pic
    find(:xpath, "//a[@href='/posts/1']").click
    expect(page).to have_content 'A lovely cat'
  end

  scenario 'can delete post' do
    post_pic
    find(:xpath, "//a[@href='/posts/1']").click
    click_link 'Delete post'
    expect(Post.all).to be_empty
  end

end
