require 'Rails_helper'

feature 'A user can comment on an image' do
  scenario 'displays the comment' do
    sign_up_and_in("Russell", "Vaughan", "russellvaughan", "russell@example.com")
    create_photo
    click_link("Add a comment")
    fill_in("comment[body]", with: "you have a cute cat" )
    click_button("Create Comment")
    expect(page).to have_content("you have a cute cat" )
  end
   scenario 'displays the commenters email' do
    sign_up_and_in("Russell", "Vaughan", "russellvaughan", "russell@example.com")
    create_photo
    click_link("Add a comment")
    fill_in("comment[body]", with: "you have a cute cat" )
    click_button("Create Comment")
    expect(page).to have_content("russell@example.com" )
  end
end

feature 'A user can edit and delete a comment' do
scenario 'edit a comment' do
  sign_up_and_in("Russell", "Vaughan", "russellvaughan", "russell@example.com")
  create_photo
 	add_comment
 	click_link("Edit Comment")
 	fill_in("comment[body]", with: "you have the cutest cat" )
  click_button("Update Comment")
 	expect(page).to have_content("you have the cutest cat")
end
scenario 'delete a comment' do
  sign_up_and_in("Russell", "Vaughan", "russellvaughan", "russell@example.com")
  create_photo
 	add_comment
  expect(page).to have_content('whats here?')
 	click_link("Delete Comment")
 	expect(page).not_to have_content("you have a cute cat")
end
end

feature 'a user can only edit and delete their own comment' do 
scenario 'cannot delete another users comment' do
sign_up_and_in("Russell", "Vaughan", "russellvaughan", "russell@example.com")
create_photo
add_comment
click_link('Sign Out')
sign_up_and_in("Johnny", "Appleseed", "jappleseeed", "johnny@example.com")
expect(page).not_to have_link("Delete Comment")
end

scenario 'cannot edit another users comment' do
sign_up_and_in("Russell", "Vaughan", "russellvaughan", "russell@example.com")
create_photo
add_comment
click_link('Sign Out')
sign_up_and_in("Johnny", "Appleseed", "jappleseeed", "johnny@example.com")
expect(page).not_to have_link("Edit Comment")
end



end




