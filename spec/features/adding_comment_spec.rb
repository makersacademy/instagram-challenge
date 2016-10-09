require 'rails_helper'

# feature 'adding comments' do
#
#    let!(:user){ User.create(email: "test@example.com", password: "123456") }
#    let!(:photos){ Photo.create(name: "test", description: "test", image_file_name: 'test', image_file_size: '0', image_content_type: 'jpg', user_id: user.id) }
#
#   scenario 'a user can add comments' do
#     sign_in
#     add_photo
#
#     visit ("/photos/#{photos.id}/comments/new")
#     click_link("")
#     expect(current_path).to eq("/photos/#{photo.id}/comments")
#     expect(page).to have_content('Comments')
#     fill_in('comment', with: 'Nice place!')
#     click_button('Submit')
#     expect(current_path).to eq('/photos')
#     expect(page).to have_content('Nice place!')
#   end
# end
