require 'rails_helper'

feature 'liking posts' do

  scenario 'a user can endorse a review, which updates the review endorsement count' do
    signup
    create_post
    visit '/'
    click_link 'Like' #are we endorsing restaurants or the review of the restaurants?
    expect(page).to have_content('1 like')
  end

end
