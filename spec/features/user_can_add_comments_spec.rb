require 'rails_helper'

feature "a user can add a comment" do
  scenario "to his posts" do
    sign_up_and_add_post
    click_link('Add a comment')
    add_comment
    expect(page).to have_content('Amazing')
    expect(current_path).to eq("/users/1")
  end

  scenario "to other user's posts" do
    sign_up_and_add_post
    click_link('Log out')
    visit "/"
    click_link "Sign up"
    sign_up(name: "Nono", email: "Nono@fake.com")
    expect(current_path).to eq("/users/2")
    visit("/users/1")
    click_link('Add a comment')
    add_comment(message: "Greeeeat!")
    expect(page).to have_content('Greeeeat!')
  end

  scenario "only if signed in" do
    sign_up_and_add_post
    click_link('Log out')
    visit("/users/1")
    expect(page).to_not have_content('Add a comment')
  end
end
