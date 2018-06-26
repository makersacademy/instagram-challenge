require 'rails_helper'


feature 'Displaying posts' do
  background do
    user = create(:user)
    post_one = create(:post, caption: "This is post one", user_id: user.id)
    post_two = create(:post, caption: "This is post two", user_id: user.id)

    sign_in_with user
  end


  scenario 'the index displays the correct created post info' do
    expect(page).to have_content("This is post one")
    expect(page).to have_css("img[src*='dog']")
    expect(page).to have_content("This is post two")
  end

  scenario 'each post has a link to take you to that post' do
    find(:xpath, "//a[contains(@href,'posts/1')]", match: :first).click
    expect(page).to have_content("This is post one")
    expect(page).to have_css("img[src*='dog']")
  end
end
