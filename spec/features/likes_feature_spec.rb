require 'rails_helper'

feature 'Likes' do

before do
  upload_photo
end

  scenario 'a user can like a photo, which updates the number of likes' do
    visit '/photos'
    find('#like').click
    expect(page).to have_content('1 like')
  end

end
