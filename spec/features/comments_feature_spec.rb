require 'rails_helper'

feature 'Leaving comments' do

  scenario 'allows a user to leave a comment on photo' do
    upload_photo
    leave_a_comment
    expect(current_path).to eq '/pictures'
    expect(page).to have_content 'Meet Coco'
  end

end
