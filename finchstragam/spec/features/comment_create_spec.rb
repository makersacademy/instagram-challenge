require 'rails_helper'

feature 'Add comment for a picture' do
  scenario 'displays posted comment for a picture' do
    picture = create_picture
    comment = create_comment

    sign_up
    create_valid_picture
    create_valid_comment

    expect(page).to have_current_path picture_path(1)
    expect(page).to have_content comment
  end
end
