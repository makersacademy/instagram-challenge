require 'rails_helper'

feature "Pictures" do
  before do
    visit '/'
    click_link('Sign up')
    fill_in('Email', with: 'test@test.com')
    fill_in('Password', with: 'Password')
    fill_in('Password confirmation', with: 'Password')
    click_button('Sign up')
    click_link('Upload image')

  end
  context "User signed in" do
    it "Should see posted photos" do
      
    end
  end
end
