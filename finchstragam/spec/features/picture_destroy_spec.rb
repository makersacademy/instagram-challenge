require 'rails_helper'

feature 'Destroy a picture' do
  scenario 'removes picture from database' do
    picture = create_picture

    create_valid_picture
    click_on 'Back'
    expect(page).to have_current_path '/pictures'
    click_on 'Delete'
    expect(page).not_to have_content picture[:description]
  end
end
