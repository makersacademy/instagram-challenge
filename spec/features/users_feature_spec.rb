require 'rails_helper'

feature "User accounts" do
  context "user not signed in and on homepage" do
    it "should see 'sign in' and 'sign up' links" do
      visit '/'
      expect(page).to have_link 'Sign up'
      expect(page).to have_link 'Sign in'
    end

    it "should not be able to post a picture" do
      visit '/'
      click_link 'Upload a picture'
      expect(page).to have_content 'You need to sign in or
                                    sign up before continuing'
      expect(page).not_to have_content 'Test description'
    end
  end

end
