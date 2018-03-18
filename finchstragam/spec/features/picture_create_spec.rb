require 'rails_helper'

feature 'Post a picture' do
  scenario 'displays posted picture along with description' do
    picture = create_picture

    create_valid_picture

    # expect(page).to have_css("img[src*=" + picture[:link] + "]")
    expect(page).to have_css("img[src*='https://cdn.pixabay.com/photo/2017/08/12/19/01/walk-2635038_960_720.jpg']")
    expect(page).to have_content picture[:description]
  end

  scenario 'raises error when a required field is empty' do
    picture = create_picture

    create_invalid_picture

    expect(page).not_to have_content picture[:link]
    expect(page).to have_content "Description can't be blank"
  end
end
