require 'rails_helper'

feature 'A logged in user' do

  before do
    sign_up('test@test.com')
    click_link 'Sign out'
    sign_up('test1@test.com')
    click_link 'Sign out'
    visit '/'
  end

  scenario 'can add a new picture' do
    sign_in('test@test.com')
    add_picture
    expect(page).to have_content 'Betty'
    expect(page).not_to have_content 'no photos have been added!'
  end

  context 'deleting pictures' do

    scenario 'can be done by the owner of the picture' do
      sign_in('test@test.com')
      add_picture
      click_link 'Delete Betty'
      expect(page).not_to have_content 'My Cat'
      expect(page).to have_content 'No photos have been added!'
    end

    scenario 'cannot be done by other users' do
      sign_in('test@test.com')
      add_picture
      click_link 'Sign out'
      expect(page).not_to have_link 'Delete Betty'
    end

    scenario 'cannot be done when logged out' do
      expect(page).not_to have_link 'Delete Betty'
    end
  end
end