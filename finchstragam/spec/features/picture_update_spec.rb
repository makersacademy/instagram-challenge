require 'rails_helper'

feature 'Update a picture' do
  scenario 'displays updated picture' do
    create_picture
    click_on 'Back'
    click_on 'Edit'
    fill_in :"picture[description]", with: 'A sunny path and a pair of shiny red trainers'
    click_on 'Update Picture'
    click_on 'Back'
    expect(page).to have_content 'A sunny path and a pair of shiny red trainers'
  end
end
