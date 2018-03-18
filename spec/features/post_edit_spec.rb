require 'rails_helper'

feature 'delete a post' do
  scenario 'removes post from database' do
    create_new_post
    click_link 'Edit'
    fill_in :"post[photo]", with: "https://i.imgur.com/rE8X4ir.jpg"
    fill_in :"post[description]", with: "This one is much better"
    click_button 'Update Post'
    expect(page).to have_current_path(/posts\/[0-9]+/)
    expect(page).to have_content 'This one is much better'
  end
end