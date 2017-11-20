require 'rails_helper'

feature 'Post' do
  scenario 'make a new post' do
    given_that_i_am_logged_in
    # when_i_make_a_new_post
    # then_the_image_and_caption_appear_on_the_homepage
  end
end

def given_that_i_am_logged_in
  visit root_url
  within(:css, "p.navbar-text.pull-right") do
    click_on 'Sign up'
  end
  expect(current_url).to eq(new_user_registration_url)
  within(:css, "form.new_user") do
    fill_in 'user_email', with: "example@email.com"
    fill_in 'user_password', with: "password"
    fill_in 'user_password_confirmation', with: "password"
    click_on 'Sign up'
  end
end
