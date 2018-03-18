require 'rails_helper'

feature 'Create a comment' do
  scenario 'user can add a valid comment' do 
    create_new_post
    create_new_comment
    expect(page).to have_content('carlos@example.com')
    expect(page).to have_content('This picture is great!')
  end
end 