require 'rails_helper'

feature 'Root page' do
  scenario 'has a root page' do
    visit '/'
    expect(page.status_code).to eq 200
  end

  context 'links' do

    before { visit '/' }

    context 'user is not logged in' do
      scenario 'should NOT see "Sign out" link' do
        expect(page).to_not have_link 'Sign out'
      end

      scenario 'should see "Sign up" and "Sign in" links' do
        expect(page).to have_link 'Sign up'
        expect(page).to have_link 'Sign in'
      end
    end

    context 'user is logged in' do
      before { sign_up }
      scenario 'should see "Sign out" link' do
        expect(page).to have_link 'Sign out'
      end
      scenario 'should NOT see "Sign up" and "Sign in" links' do
        expect(page).to_not have_link 'Sign in'
        expect(page).to_not have_link 'Sign up'
      end
    end

  end
end
