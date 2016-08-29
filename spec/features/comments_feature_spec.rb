require 'rails_helper'

feature 'commenting' do



  scenario 'allow users to leave a comment using a form' do
    user_sign_up
    create_post
    # visit '/posts'
    click_link 'Comment'
    fill_in "Comment", with: "nice"
    click_button 'Leave Comment'

    expect(current_path).to eq '/posts'
    expect(page).to have_content('nice')
  end
end
