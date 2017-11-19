require 'rails_helper'
feature "Sign-up" do
  scenario "New user" do
    given_that_i_am_a_new_user_visiting_unconvincedagram
    # given that I am a new user visiting the website
    # when I sign-up to Unconvincedagram
    # then a new user account is created
    # and I am redirected to the home page
  end

  def given_that_i_am_a_new_user_visiting_unconvincedagram
    visit "/"
    expect(current_url).to eq(new_user_session_url)
  end

  def when_i_sign_up_to_unconvincedagram
    within(:css, "p#navbar-text pull-right") do
      click('Sign Up')
    end
    expect(current_url).to eq(new_user_registration_url)
  end
end
