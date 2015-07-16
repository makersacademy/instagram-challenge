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
    expect(Picture.count).to eq 1
    expect(page).to have_content 'Betty'
    expect(page).not_to have_content 'No photos have been added!'
  end

  scenario 'can search for a picture' do
    sign_in('test@test.com')
    add_picture
    add_picture2
    expect(page).to have_content 'Betty'
    expect(page).to have_content 'Daryl'
    fill_in 'search', with: 'Betty'
    click_button 'Search'
    expect(page).to have_content 'Betty'
    expect(page).not_to have_content 'Daryl'
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

    scenario 'also deletes all associated comments' do
      sign_in('test@test.com')
      add_picture
      add_comment('Cool')
      click_link 'Delete Betty'
      expect(page).not_to have_content 'Betty'
      expect(Comment.count).to eq 0
    end
  end
end