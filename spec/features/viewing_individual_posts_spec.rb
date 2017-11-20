require 'spec_helper'
require 'web_helper'

feature 'Can view individual posts' do
  scenario 'Can click and view a single post' do
    create_post
    visit '/'
    # binding.pry
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'View Post'
    expect(page).to have_content "Your Post:"
  end
end
