require 'rails_helper'

feature "can like post" do
  scenario "user can like post and see number of likes" do
    sign_up_and_sign_in
    click_link 'New Post'
    attach_file('post[image]', "spec/files/images/mum.jpeg")
    fill_in 'post[description]', with: 'me and my sweet kids'
    click_button 'submit'
    click_link 'Like'
    expect(page).to have_text '1'
  end
end
