require 'rails_helper'

feature 'comments' do
  before do
    user = create(:user)
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    @picture = create(:picture)
  end

  scenario 'allows comments on a picture using a form' do
    visit picture_path(@picture)
    click_link "Comment on this picture"
    fill_in "comment_thoughts", with: "Nice!"
    click_button "Post Comment"
    expect(current_path).to eq picture_path(@picture)
    expect(page).to have_content("Nice!")
  end
end
