require "rails_helper"

feature "comments" do

  let!(:user1){ User.create(email: "test@test.com", password: "123456") }
  let!(:user2){ User.create(email: "test2@test.com", password: "123456") }
  let!(:post1){ Post.create(description: "visit", location: "Chain bridge in Budapest, Hungary", image_file_name: "photo_01.jpg", user: user1) }
  let!(:comment1){ Comment.create(comment: "good pic", post_id: post1.id, user: user1) }

  context "logged in" do

    before do
      sign_in
      visit "/posts"
    end

    context "add comment" do

      scenario "user can add a comment to a post, and notice is shown" do
        visit_post(post1)
        click_link("Add comment")
        expect(current_path).to eq "/posts/#{post1.id}/comments/new"

        add_comment(post: post1)
        expect(page).to have_css("div#post#{post1.id}_comments", text: "nice photo, like it")
        expect(page).to have_css("div#notice", text: "Comment successfully added.")

      end

      scenario "user can add more than 1 comments to a post" do
        visit_post_and_add_comment(post: post1)
        visit_post_and_add_comment(comment: "my favourite pic", post: post1)

        expect(page).to have_css("div#post#{post1.id}_comments", text: "nice photo, like it")
        expect(page).to have_css("div#post#{post1.id}_comments", text: "my favourite pic")
      end
    end

    context "show comment" do

      scenario "user clicks on a comment and the entire content becomes visible" do
        visit_post(post1)
        click_link("#{comment1.id}")

        expect(page).to have_css("div#comment_body", text: "good pic")
        expect(page).to have_css("div#comment_created", text: "by #{user1.email}")
        expect(find_link('Edit comment').visible?).to eq true
        expect(find_link('Delete comment').visible?).to eq true
      end

      scenario "user can go back to the post and comment is shown there" do
        visit_post(post1)
        click_link("#{comment1.id}")
        click_link("Back to post")

        expect(current_path).to eq "/posts/#{post1.id}"
        expect(page).to have_css("div#post_location", text: "Chain bridge in Budapest, Hungary")
        expect(page).to have_css("div#post#{post1.id}_comments", text: "good pic")
      end

      scenario "message available if there is no comment" do
        visit_post(post1)
        click_link("#{comment1.id}")
        click_link("Delete comment")

        expect(page).to have_css("div#post#{post1.id}_comments", text: "No comments available")
        visit "/posts"
        expect(page).to have_css("div#post#{post1.id}_comments", text: "No comments available")
      end
    end

    context "edit comment" do

      scenario "users can edit their own comment, and notice is shown" do
        visit_post(post1)
        click_link("#{comment1.id}")
        click_link("Edit comment")
        fill_in('comment_field', with: "comment updated")
        click_button "Update"

        expect(page).to have_css("div#comment_body", text: "comment updated")
        expect(page).to have_css("div#notice", text: "Comment successfully updated.")
        expect(page).to_not have_css("div#comment_body", text: "good pic")
        expect(current_path).to eq "/posts/#{post1.id}/comments/#{comment1.id}"
      end

      scenario "users cannot see 'Edit comment' link on comments that are owned by other users" do
        sign_out
        sign_in(email: "test2@test.com")
        visit_post(post1)
        click_link("#{comment1.id}")

        expect(page).not_to have_css("div#yield", text: "Edit comment")
      end

      scenario "users cannot edit comments that are not owned by them" do
        sign_out
        sign_in(email: "test2@test.com")
        visit("/posts/#{post1.id}/comments/#{comment1.id}/edit")
        click_button("Update")

        expect(current_path).to eq "/posts/#{post1.id}/comments/#{comment1.id}"
        expect(page).to have_css("div#alert", text: "You cannot update this comment.")
      end
    end

    context "delete comment" do
      scenario "users can delete their own comment, and notice is shown" do
        visit_post(post1)
        expect(page).to have_css("div#yield", text: "good pic")
        click_link("#{comment1.id}")
        click_link("Delete comment")

        expect(current_path).to eq "/posts/#{post1.id}"
        expect(page).not_to have_css("div#yield", text: "good pic")
        expect(page).to have_css("div#notice", text: "Comment successfully deleted!")
      end
    end

  end


end
