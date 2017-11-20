require 'rails_helper'
feature "Sign-up" do

  scenario "New user" do
    given_that_i_am_a_new_user_visiting_unconvincedagram
    when_i_sign_up_to_unconvincedagram
    then_i_am_redirected_to_the_homepage
  end

  scenario "Existing email" do
    given_that_i_am_a_new_user_visiting_unconvincedagram
    when_i_sign_up_to_unconvincedagram_using_an_email_already_registered
    then_i_am_redirected_to_the_signup_page_and_shown_an_error
  end

  def given_that_i_am_a_new_user_visiting_unconvincedagram
    visit "/"
    expect(current_url).to eq(new_user_session_url)
  end

  def when_i_sign_up_to_unconvincedagram
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

  def then_i_am_redirected_to_the_signup_page_and_shown_an_error
    expect(current_url).to eq(user_registration_url)
    within(:css, "div#error_explanation") do
      expect(page).to have_content "Email has already been taken"
    end
  end

  def when_i_sign_up_to_unconvincedagram_using_an_email_already_registered
    when_i_sign_up_to_unconvincedagram
    within(:css, "p.navbar-text.pull-right") do
      click_on 'Logout'
    end
    when_i_sign_up_to_unconvincedagram
  end

  def then_i_am_redirected_to_the_homepage
    expect(current_url).to eq(root_url)
    within(:css, "p.notice") do
      expect(page).to have_content "Sign up successful. Welcome to Unconvincedagram."
    end
  end

end
