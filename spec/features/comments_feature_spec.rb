require 'rails_helper'

RSpec.feature 'commenting', :type => :feature  do
  include WebHelpers
  user1 = {email: 'test@email.com', password: 'notpassword'}

  scenario 'allows users to comment on a pun with a form' do
    sign_up(user1)
    create_pun
    click_link 'Comment on Pun1'
    fill_in 'Thoughts', with: 'so so'
    click_button 'Leave Comment'
    expect(current_path).to eq '/puns'
    click_link 'Pun1'
    expect(page).to have_content('so so')
  end
end
