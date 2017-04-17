require 'rails_helper'

feature 'commenting' do
  before {Picture.create}

  scenario 'allows users to leave a review using a form' do
    visit '/pictures'
    click_link 'comment'

    fill_in "comment[thought]", with: "hot!"
    click_button 'post'

    expect(current_path).to eq '/pictures'
    expect(page).to have_content('hot')
  end

end