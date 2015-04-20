require 'rails_helper'
require 'features/helpers/helpers'

RSpec.configure do |c|
  c.include Helpers
end


describe 'User' do

  context 'not signed in and on homepage' do

    it 'should see sign in and sign up links' do
      visit '/posts'
      expect(page).to have_button 'Log in'
      expect(page).to have_link 'Sign up'
    end

    it 'should not see a sign out link' do
      visit '/posts'
      expect(page).not_to have_link 'Sign out'
    end

  end

  context 'signed in' do

    before do
      sign_in_helper
    end

    it 'should see sign out' do
      visit '/posts'
      expect(page).to have_link 'Sign out'
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/posts')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end

  end

end