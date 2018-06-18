# frozen_string_literal: true

feature "Index displays a list of posts" do
  scenario "the index displays correct created post information" do
    user = create(:user)
    create(:post, description: "Hello world!", user_id: user.id)
    create(:post, description: "another post", user_id: user.id)
    sign_in user

    expect(page).to have_content("Hello world!")
    expect(page).to have_content("another post")
    expect(page).to have_css("img[src*='1.jpeg']")
  end
end
