require 'rails_helper'

RSpec.feature "Feed", type: :feature do
  scenario "Can submit posts and view them" do
    sign_up
    create_new_post
    expect(page.find('.posts-index li:first-child')).to have_content("Hello, world")
  end
end

RSpec.feature "Timeline", type: :feature do
  scenario "posts are displayed in reverse order with message and timestamp" do
    sign_up
    create_new_post
    create_new_post(title: "There is not enough time to do all the nothing we want to do")
    create_new_post(title: "Oooh! What does THAT button do?")
    expect(page.find('.posts-index li:first-child')).to have_content("Oooh! What does THAT button do?")
    expect(page.find('.posts-index li:first-child')).to have_content(Post.last.created_at.localtime.strftime('%d-%b-%Y %I:%M:%S %p'))
  end
end

def create_new_post(title: "Hello, world")
  visit "/posts"
  click_link "New post"
  fill_in "Title", with: title
  page.attach_file('post_image', Rails.root + 'spec/fixtures/files/test.png')
  click_button "Submit"
end
