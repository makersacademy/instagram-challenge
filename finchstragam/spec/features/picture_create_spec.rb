require 'rails_helper.rb'

feature 'Post a picture' do
  scenario 'displays posted picture along with description' do
    create_picture
    expect(page).to have_content 'https://cdn.pixabay.com/photo/2017/08/12/19/01/walk-2635038_960_720.jpg'
    expect(page).to have_content 'A sunny path'
  end

  scenario 'raises error when a required field is empty' do
    create_invalid_picture
    expect(page).not_to have_content 'https://cdn.pixabay.com/photo/2017/08/12/19/01/walk-2635038_960_720.jpg'
    expect(page).to have_content "Description can't be blank"
  end
end
