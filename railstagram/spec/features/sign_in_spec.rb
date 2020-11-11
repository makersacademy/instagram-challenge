require 'rails_helper'

RSpec.feature('Signing In') do
    scenario('User uses a correct account') do
        sign_up
        click_link "Sign Out"
        visit('/users/sign_in')
        fill_in :user_username, with: "dill"
        fill_in :user_email, with: "anemail@email.com"
        fill_in :user_password, with: "123456"
        click_button "Log in"
        expect(page).to have_content "Signed in successfully"
    end
    
    scenario('User uses an incorrect email') do
        sign_up
        click_link "Sign Out"
        visit('/users/sign_in')
        fill_in :user_username, with: "dill"
        fill_in :user_email, with: "notanemail@email.com"
        fill_in :user_password, with: "123456"
        click_button "Log in"
        expect(page).to have_content "Invalid Email or password."
    end

    scenario('User uses an incorrect email') do
        sign_up
        click_link "Sign Out"
        visit('/users/sign_in')
        fill_in :user_username, with: "dill"
        fill_in :user_email, with: "anemail@email.com"
        fill_in :user_password, with: "000000"
        click_button "Log in"
        expect(page).to have_content "Invalid Email or password."
    end

end
