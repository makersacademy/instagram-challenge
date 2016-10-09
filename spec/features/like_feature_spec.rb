require "rails_helper"

feature "likes" do

  let!(:user1){ User.create(email: "test@test.com", password: "123456") }
  let!(:user2){ User.create(email: "test2@test.com", password: "123456") }
  let!(:post1){ Post.create(description: "visit", location: "Chain bridge in Budapest, Hungary", image_file_name: "photo_01.jpg", user: user1) }

  context "logged out" do

  end

  context "logged in" do
    before { sign_in(email: "test2@test.com") }

    context "like a post" do
      scenario "user can like a post if logged in" do
        visit_post(post1)
        expect(page).to have_css("div#likes", text: "0")
        click_link("Like")

        expect(current_path).to eq "/posts/#{post1.id}"
        expect(page).to have_css("div#likes", text: "1")
        expect(page).not_to have_css("div#likes", text: "0")
        expect(page).to have_css("div#notice", text: "You liked the post.")
      end

      scenario "users cannot like their own posts" do
        sign_out
        sign_in
        visit_post(post1)
        click_link("Like")

        expect(page).to have_css("div#likes", text: "0")
        expect(page).to have_css("div#alert", text: "You cannot like your own post.")
      end

    end

    context "unlike a post" do
      scenario "user can unlike a post if logged in and liked it recently" do
        visit_post(post1)
        click_link("Like")
        expect(page).to have_css("div#likes", text: "1")
        click_link("Liked")

        expect(current_path).to eq "/posts/#{post1.id}"
        expect(page).to have_css("div#likes", text: "0")
        expect(page).not_to have_css("div#likes", text: "1")
        expect(page).to have_css("div#notice", text: "You unliked the post.")
      end
    end

  end

  context "logged out" do
    context "like a post" do

      scenario "user cannot like a post if logged out" do
        visit_post(post1)

        expect(current_path).to eq "/posts/#{post1.id}"
        expect{click_link("Like")}.to raise_error(Capybara::ElementNotFound)
      end
    end
  end

end
