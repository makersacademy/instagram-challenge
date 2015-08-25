require 'rails_helper'

feature 'liking photos' do
  let(:user) do
    create(:user)
  end

  it 'a user can endorse a review, which increments the endorsement count', js: true do
    login_as user
    add_photo
    expect(page).to have_content('Grumpy cat')
    click_link 'like'
    expect(page).to have_content("1 like")
  end

end