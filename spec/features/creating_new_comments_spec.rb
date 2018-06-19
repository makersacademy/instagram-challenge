require 'rails_helper.rb'

feature 'Editing posts' do
  background do
    user = create(:user)
    post_one = create(:post, user_id: user.id)

    sign_in_with user
  end

  scenario 'can comment on a post' do
    fill_in 'comment[content]', with: "Wow, what a great photo"
    click_button 'Post'
    expect(page).to have_content("Wow, what a great photo")
  end

  scenario 'can add multiple comments on a post' do
    fill_in 'comment[content]', with: "Nice picture"
    click_button 'Post'
    fill_in 'comment[content]', with: "Amazing shot!"
    click_button 'Post'
    expect(page).to have_content("Nice picture")
    expect(page).to have_content("Amazing shot!")
  end
end
