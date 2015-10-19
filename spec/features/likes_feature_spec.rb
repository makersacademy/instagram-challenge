require 'rails_helper'

feature 'post get likes' do
  before {Post.create name: 'Bird'}

  scenario 'allows users to leave a like using a form' do
     visit '/posts'
    click_link 'Like it' #are we endorsing restaurants or the review of the restaurants?
    expect(page).to have_content('1 Like')
  end

end
