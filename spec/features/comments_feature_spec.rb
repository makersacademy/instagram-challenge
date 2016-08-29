require 'rails_helper'

feature 'Comments' do

  before do
    sign_up
    create_photo
  end

  let(:photo_url) { "/photos/#{Photo.last.id}" }

  scenario 'must be logged in to leave a comment' do
    sign_out
    visit photo_url
    expect(page).to_not have_field 'Comment'
    expect(page).to_not have_button 'Post'
  end

  scenario 'user can leave a comment on a photo' do
    visit photo_url
    fill_in 'Comment', with: 'Beautiful photo!!'
    click_button 'Post'
    expect(page).to have_content 'Beautiful photo!!'
  end

  context 'deleting comments' do

    before do
      visit photo_url
      create_comment(comment: 'This photo is amazing')
    end

    scenario 'owner can delete a his/her comment' do
      visit photo_url
      expect(page).to have_link 'Delete comment'
      click_link 'Delete comment'
      expect(page).to_not have_content 'This photo is amazing'
    end

    scenario 'user cannot delete someone else\'s comments' do
      sign_out
      sign_up(email: 'anotheruser@gmail.com', username: 'anotherUser')
      visit photo_url
      expect(page).to_not have_link 'Delete comment'
    end

  end

end
