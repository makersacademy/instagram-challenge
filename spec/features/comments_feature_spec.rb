require 'rails_helper'

RSpec.feature '<<Comments>>' do
  before do
    sign_up_1
    add_picture
  end
  scenario 'users may comment on an image' do
    visit '/pictures'
    click_link 'Pirate Party!'
    post_comment
    expect(page).to have_content 'Arggh!'
  end

  scenario 'comments should show user name and timestamp' do
    visit '/pictures'
    click_link 'Pirate Party!'
    post_comment
    expect(page).to have_content 'Blackbeard'
    expect(page).to have_content 'Posted one hour ago'
  end

end
