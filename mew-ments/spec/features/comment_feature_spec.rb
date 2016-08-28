require 'rails_helper'

feature 'comment' do
  before { Mewment.create caption: 'Just a little Pro-cat-stination'}

  scenario 'write a comment on a mewment' do
    visit '/mewments'
    click_link 'Comment'
    fill_in 'Message', with: "you should be more pro-dog-tive"
    click_button 'Comment'

    expect(current_path).to eq '/mewments'
    expect(page).to have_content('you should be more pro-dog-tive')
  end
end
