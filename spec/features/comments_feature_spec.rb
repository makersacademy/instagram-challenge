require 'rails_helper'

feature 'commenting' do
  let!(:kitty){ Photograph.create(caption: "Kitty!") }
  let!(:user) do
    User.create(email: 'test@example.com',
                password: 'testtest',
                password_confirmation: 'testtest')
  end

  scenario "user can leave a comment using a form" do
    sign_in(email: user.email, password: user.password)
    click_link "Kitty!"
    click_link "Comment"
    expect(current_path).to eq "/photographs/#{kitty.id}/comments/new"
    fill_in "Comment", with: "It's so fluffy, I'm gonna die!"
    click_button "Leave Comment"
    expect(current_path).to eq "/photographs/#{kitty.id}"
    expect(page).to have_content "It's so fluffy, I'm gonna die!"
  end

  scenario "user can not leave a comment that is invalid" do
    sign_in(email: user.email, password: user.password)
    click_link "Kitty!"
    click_link "Comment"
    fill_in "Comment", with: "zz"
    click_button "Leave Comment"
    expect(page).not_to have_css 'li', text: "zz"
    expect(page).to have_content 'error'
  end

  let!(:kitty_comment){ kitty.comments.create(comment: "It's so fluffy, I'm gonna die!")}

  scenario "user can update a comment" do
    sign_in(email: user.email, password: user.password)
    click_link "Kitty!"
    click_link "Edit Comment"
    expect(current_path).to eq "/photographs/#{kitty.id}/comments/#{kitty_comment.id}/edit"
    fill_in "Comment", with: "It's so fluffy, I must own it!"
    click_button "Update Comment"
    expect(current_path).to eq "/photographs/#{kitty.id}"
    expect(page).to have_content "It's so fluffy, I must own it!"
    expect(page).not_to have_content "It's so fluffy, I'm gonna die!"
  end

  scenario "user can delete a comment" do
    sign_in(email: user.email, password: user.password)
    click_link "Kitty!"
    click_link "Delete Comment"
    expect(current_path).to eq "/photographs/#{kitty.id}"
    expect(page).not_to have_content "It's so fluffy, I'm gonna die!"
  end
end
