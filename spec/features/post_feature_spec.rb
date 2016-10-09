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

    context "add post" do

      scenario "user cannot add a post if not logged in" do
        visit "/posts"
        click_link("New post")

        expect(current_path).to eq "/users/sign_in"
        expect(page).to have_css("div#alert", text: "You need to sign in or sign up before continuing.")
        expect(page).not_to have_css("div#yield", text: "New post")
      end

      context "logged in" do

        before do
          sign_in
          visit "/posts"
          click_link("New post")
        end

        scenario "user can add post if logged in" do
          expect(current_path).to eq "/posts/new"

          fill_in("Description", with: "visit Budapest")
          fill_in("Location", with: "Chain Bridge in Budapest, Hungary")
          attach_file("Image", "spec/assets/photo_01.jpg")
          click_button("Post it")

          post = Post.first()

          expect(page).to have_css("div#post#{post.id}_body",text: "visit Budapest")
          expect(page).to have_css("div#post#{post.id}_location", text: "Chain Bridge in Budapest, Hungary")
          expect(page).to have_css("img[src*='photo_01']")
        end

        scenario "user cannot add post w/o description" do
          fill_in("Location", with: "Chain in Budapest, Hungary")
          attach_file("Image", "spec/assets/photo_01.jpg")
          click_button("Post it")

          expect(page).to have_css("section#errors", text: "Description can't be blank")
        end

        scenario "user cannot add post w/o an image" do
          fill_in("Description", with: "visit Budapest")
          fill_in("Location", with: "Chain in Budapest, Hungary")
          click_button("Post it")

          expect(page).to have_css("section#errors", text: "Image can't be blank")
        end
      end
    end

    context "show post" do

      let!(:post1){ Post.create(description: "visit", location: "Chain bridge in Budapest, Hungary", image_file_name: "photo_01.jpg", user: user1) }

      before do
        sign_in
        visit "/posts"
      end

      scenario "user can see the post on a separate page" do
        click_link "visit"
        expect(current_path).to eq "/posts/#{post1.id}"
        expect(page).to have_css("div#post_body", text: "visit")
        expect(page).to have_css("div#post_location", text: "Chain bridge in Budapest, Hungary")
        expect(page).to have_css("img[src*='photo_01']")
      end

      scenario "post shows the email of user who created the post" do
        click_link "visit"
        expect(page).to have_css("div#post_created", text: "by #{user1.email}")

        visit "/posts"
        expect(page).to have_css("div#post#{post1.id}_created", text: "Posted on: #{post1.created_at.strftime('%d/%m/%y')} (by #{user1.email})")
      end

    end

    context "edit post" do
      let!(:post1){ Post.create(description: "visit", location: "Chain bridge in Budapest, Hungary", image_file_name: "photo_01.jpg", user: user1) }

      before do
        sign_in
        visit "/posts"
      end

      scenario "user can edit a post" do
        click_link "visit"
        click_link "Edit post"
        expect(current_path).to eq "/posts/#{post1.id}/edit"

        fill_in("Description", with: "weekend visit")
        click_button("Update")

      end
    end

    context "delete post" do
      let!(:post1){ Post.create(description: "visit", location: "Chain bridge in Budapest, Hungary", image_file_name: "photo_01.jpg", user: user1) }
      let!(:comment1){ Comment.create(comment: "good pic", post_id: post1.id, user: user1) }

      before do
        sign_in
        visit "/posts"
      end

      scenario "users can delete their own post" do
        click_link "visit"
        click_link "Delete post"

        expect(current_path).to eq "/posts"
        expect(page).not_to have_css("div#yield", text: "Chain bridge in Budapest, Hungary")
        expect(page).not_to have_css("div#yield", text: "good pic")
      end
    end

  end

end
