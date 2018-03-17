require 'rails_helper'

feature 'Update a picture' do
  scenario 'displays updated picture' do
    picture = create_picture

    create_valid_picture
    click_on 'Back'
    click_on 'Edit'
    fill_in :"picture[description]", with: 'A pair of shiny red trainers'
    click_on 'Update Picture'
    click_on 'Back'
    expect(page).not_to have_content 'A sunny path'
    expect(page).to have_content 'A pair of shiny red trainers'
  end
end
