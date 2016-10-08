require "rails_helper"

feature "posts" do

  let!(:user1){ User.create(email: "test@test.com", password: "123456") }

  context "no post available" do

    scenario "user is informed if no post found" do
      visit "/posts"
      expect(page).to have_css("div#yield", text: "No post found")
    end
  end

  context "manage posts" do

    before do

    end

    context "add post" do

      scenario "user cannot add a post if not logged in" do
        visit "/posts"
        click_link("New post")

        expect(current_path).to eq "/users/sign_in"
        expect(page).to have_css("div#alert", text: "You need to sign in or sign up before continuing.")
        expect(page).not_to have_css("div#yield", text: "New post")
      end

      scenario "user can add post if logged in" do
        sign_in
        visit "/posts"
        click_link("New post")
        expect(current_path).to eq "/posts/new"

        fill_in("Description", with: "it was a nice weekend")
        fill_in("Location", with: "Parliament in Budapest, Hungary")
        click_button("Post it")

        expect(page).to have_content("it was a nice weekend")
        expect(page).to have_content("Parliament in Budapest, Hungary")
      end


    end

    context "edit post" do

    end

    context "delete post" do

    end

  end

end
