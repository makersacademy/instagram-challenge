require 'Rails_helper'

feature 'A user can comment on an image' do
  scenario 'comment on an image' do
    sign_up_and_in("Russell", "Vaughan", "russellvaughan", "russell@example.com")
    create_photo
    fill_in('Comment', with: "you have a cute cat" )
    click_link("Add Comment")
    expec
  end
end