require 'rails_helper'

feature 'commenting' do

  before {Photo.create caption: 'sunrise'}

  before(:each) do
    sign_up_with('test@example.com')
    post_photo('sunrise')
    leave_comment('nice photo')
    Timecop.freeze(Time.local(2015))
  end

  after do 
    Timecop.return
  end

  scenario 'allows users to leave a comment using a form' do
    expect(current_path).to eq '/photos'
    expect(page).to have_content('nice photo')
  end

  scenario 'user can delete a comment' do
    click_link 'Delete Comment'
    expect(page).not_to have_content('nice photo')
    expect(page).to have_content('Comment deleted successfully')
  end

  scenario 'user can delete only their own comments' do
    click_link 'Sign out'
    sign_up_with('new@example.com')
    expect(page).not_to have_content('Delete Comment')
  end
end