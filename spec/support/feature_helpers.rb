require 'rails_helper'

module FeatureHelpers
  # def create_restaurant(name)
  #   visit '/'
  #   click_link('Add Restaurant')
  #   fill_in 'restaurant[name]', with: name
  #   fill_in 'restaurant[description]', with: 'a restaurant that serves pizza pie'
  #   click_button('Save Restaurant')
  # end
  #
  # def add_review(rating)
  #   visit '/restaurants/1/review/new'
  #   fill_in 'review[rating]', with: rating
  #   fill_in 'review[comment]', with: "What a wonderful meal we had, thoroughly recommend it, the digestion and excretion were well facilitated too"
  #   click_button('Submit')
  # end

  def user_sign_up
    click_on("sign_up_btn")
    fill_in 'user[email]', with: "johnny@appleseed.com"
    fill_in 'user[password]', with: "password123"
    fill_in 'user[password_confirmation]', with: "password123"
    click_button("Sign up")
  end

  def user_log_in
    click_link("log_in_link")
    fill_in 'user[email]', with: "johnny@appleseed.com"
    fill_in 'user[password]', with: "password123"
    click_button("Log in")
  end

  def user_log_out
    click_link("Log out")
  end

  # def edit_restaurant(name)
  #   fill_in 'restaurant[name]', with: name
  #   fill_in 'restaurant[description]', with: 'a restaurant that serves pizza pie'
  #   click_button('Save Restaurant')
  # end

end
