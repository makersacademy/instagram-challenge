require 'rails_helper'

feature 'liking mewments' do
  before do
    sign_up
    create_mewment("Am I Pawllywood ready or what!", 'Pawllywood.jpg')
  end

  it 'a user can like a mewment', js:true do
    visit '/mewments'
    click_link 'like'
    expect(page).to have_content('1 like')
  end

end
