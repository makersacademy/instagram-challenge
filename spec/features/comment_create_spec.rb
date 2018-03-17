require 'rails_helper'

feature 'Create a comment' do
  scenario 'saves the comment and displays it on picture#show when the field is valid' do
    sign_up
    create_picture
    find("img[src*='https://i1.wp.com/krinkle.net/wordpress/img/AppleMouse/TheDirtErrLint.jpg']").click
    fill_in "comment[body]", with: "I really like this piece of lint"
    click_button "Save comment"
    expect(page).to have_current_path '/pictures/1'
    expect(page).to have_content "lint@lint.com commented"
    expect(page).to have_content "I really like this piece of lint"
  end

  scenario "doesn't save comment and displays error when comment invalid" do
    sign_up
    create_picture
    find("img[src*='https://i1.wp.com/krinkle.net/wordpress/img/AppleMouse/TheDirtErrLint.jpg']").click
    fill_in "comment[body]", with: ""
    click_button "Save comment"
    expect(page).to have_content "Body can't be blank"
    expect(page).not_to have_content "lint@lint.com commented:"
  end
end
