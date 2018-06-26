require 'rails_helper.rb'

feature 'Deleting posts' do
  background do
    user = create(:user)
    user2 = user2 = create(:user, username: "Dave",
                          email: 'as@email.com',
                          password: "123456",
                          password_confirmation: "123456",
                          id: 2)
    post_one = create(:post, user_id: user.id)

    sign_in_with user2
    fill_in 'comment[content]', with: "Wow, what a great photo"
    click_button 'Post'
  end

  scenario 'delete a comment they\'ve added to a post' do

    expect(page).to have_content("Wow, what a great photo")
    # find('.glyphicon.glyphicon-remove').click
    # page.driver.browser.switch_to.alert.accept
    find(:xpath, "//a[contains(@href,'posts/1/comments')]", match: :first).click
    expect(page).to_not have_content("Wow, what a great photo")
  end

  scenario 'cannot delete comments they haven\'t made' do
    click_link 'Log Out'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password1'
    click_button 'Log in'
    expect(page).to have_content("Wow, what a great photo")
    expect(page).to_not have_css('.glyphicon.glyphicon-remove')
  end

  scenario 'user cannot delete a comment not belonging to them via urls' do
    click_link 'Log Out'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password1'
    click_button 'Log in'
    expect(page).to have_content('Wow, what a great photo')
    page.driver.submit :delete, "posts/1/comments/1", {}
    expect(page).to have_content("Unable to remove other users comments")
    expect(page).to have_content('Wow, what a great photo')
  end
end
