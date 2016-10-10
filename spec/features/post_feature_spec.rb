require "rails_helper"

feature "posts" do

  let!(:user1){ User.create(email: "test@test.com", password: "123456") }
  let!(:user2){ User.create(email: "test2@test.com", password: "123456") }

  context "no post available" do

    scenario "user is informed if no post found" do
      visit "/posts"
      expect(page).to have_css("div#yield", text: "No post found")
    end
  end

  context "manage posts" do
    let!(:post1){ Post.create(description: "visit", location: "Chain bridge in Budapest, Hungary", image_file_name: "photo_01.jpg", user: user1) }

    context "User logged out" do
      context "add post" do
        scenario "user cannot add a post if logged out" do
          visit "/posts"
          click_link("New post")

          expect(current_path).to eq "/users/sign_in"
          expect(page).to have_css("div#alert", text: "You need to sign in or sign up before continuing.")
          expect(page).not_to have_css("div#yield", text: "New post")
        end
      end

      context "edit post" do
        scenario "user cannot edit a post if logged out" do
          visit "/posts"
          click_link "visit"

          expect(page).not_to have_css("div#yield", text: "Edit post")
        end
      end
    end

    context "User logged in" do

      before do
        sign_in
        visit "/posts"
      end

      context "add post" do
        before {click_link("New post")}

        scenario "user can add post if logged in, and notice is shown" do
          expect(current_path).to eq "/posts/new"

          fill_in("Description", with: "visit Budapest")
          fill_in("Location", with: "Bridge in Budapest, Hungary")
          attach_file("Image", "spec/assets/photo_01.jpg")
          click_button("Post it")

          post = Post.last()

          expect(page).to have_css("div#post#{post.id}_body",text: "visit Budapest")
          expect(page).to have_css("div#post#{post.id}_location", text: "Bridge in Budapest, Hungary")
          expect(page).to have_css("img[src*='photo_01']")
          expect(page).to have_css("div#notice", text: "Post successfully added.")
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

      context "show post" do

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

        scenario "users can edit their own posts, and notice is shown" do
          click_link "visit"
          click_link "Edit post"
          expect(current_path).to eq "/posts/#{post1.id}/edit"

          fill_in("Description", with: "weekend visit")
          click_button("Update")

          expect(page).to have_css("div#notice", text: "Post successfully updated.")
          expect(page).to have_css("div#post_body", text: "weekend visit")
        end

        scenario "users cannot see 'Edit post' link on posts that are owned by other users" do
          sign_out
          sign_in(email: "test2@test.com")
          visit_post(post1)

          expect(page).not_to have_css("div#yield", text: "Edit post")
        end

        scenario "users cannot edit posts that are not owned by them" do
          sign_out
          sign_in(email: "test2@test.com")
          visit("/posts/#{post1.id}/edit")
          click_button("Update")

          expect(current_path).to eq "/posts/#{post1.id}"
          expect(page).to have_css("div#alert", text: "You cannot update this post.")
        end
      end

      context "delete post" do
        let!(:comment1){ Comment.create(comment: "good pic", post_id: post1.id, user: user1) }

        scenario "users can delete their own post, and notice is shown" do
          click_link "visit"
          click_link "Delete post"

          expect(current_path).to eq "/posts"
          expect(page).to have_css("div#notice", text: "Post successfully deleted.")
          expect(page).not_to have_css("div#yield", text: "Chain bridge in Budapest, Hungary")
          expect(page).not_to have_css("div#yield", text: "good pic")
        end

        scenario "users cannot see 'Delete post' link on posts that are owned by other users" do
          sign_out
          sign_in(email: "test2@test.com")
          visit_post(post1)

          expect(page).not_to have_css("div#yield", text: "Delete post")
        end
      end
    end
  end
end
