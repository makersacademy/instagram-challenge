require "rails_helper"

feature "comments" do

  let!(:user1){ User.create(email: "test@test.com", password: "123456") }
  let!(:post1){ Post.create(description: "visit", location: "Parliament in Budapest, Hungary", image_file_name: "photo_01.jpg") }
  let!(:comment1){ Comment.create(comment: "good pic", post_id: post1.id) }

  context "logged in" do

    before do
      sign_in
      visit "/posts"
    end

    context "add comment" do

      scenario "user can add a comment to a post" do
        visit_post(post1)
        click_link("Add comment")
        expect(current_path).to eq "/posts/#{post1.id}/comments/new"

        add_comment(post: post1)
        expect(page).to have_css("div#yield", text: "nice photo, like it")

      end

      scenario "user can add more than 1 comments to a post" do
        visit_post_and_add_comment(post: post1)
        visit_post_and_add_comment(comment: "my favourite pic", post: post1)

        expect(page).to have_css("div#yield", text: "nice photo, like it")
        expect(page).to have_css("div#yield", text: "my favourite pic")
      end
    end

    context "show comment" do

      scenario "user clicks on a comment and the entire content become visible" do
        visit_post(post1)
        click_link("#{comment1.id}")

        expect(page).to have_css("div#yield", text: "good pic")

        expect(find_link('Edit comment').visible?).to eq true
        expect(find_link('Delete comment').visible?).to eq true
      end

    end

    context "edit comment" do

      scenario "users can edit their own comment" do
        visit_post(post1)
        click_link("#{comment1.id}")
        click_link("Edit comment")
        fill_in('comment_field', with: "comment updated")
        click_button "Update"

        expect(page).to have_css("div#yield", text: "comment updated")
        expect(page).to_not have_css("div#yield", text: "good pic")
        expect(current_path).to eq "/posts/#{post1.id}/comments/#{comment1.id}"
      end

    end

    context "delete comment" do
      scenario "users can delete their own comment" do
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
