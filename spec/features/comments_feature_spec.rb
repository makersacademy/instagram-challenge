require 'rails_helper'

feature 'commenting' do
  before { Travelgram.create name: 'Bali', user: User.new }

  scenario 'allows users to comment on an adventure using a form' do
    visit '/travelgrams'
    sign_up('test@test.com')
    visit '/travelgrams'
    click_link 'Bali'
    click_link 'Comment'

    fill_in 'Thoughts', with: 'looks amazing!'

    click_button 'Done'

    expect(page).to have_content 'looks amazing!'
  end

end

