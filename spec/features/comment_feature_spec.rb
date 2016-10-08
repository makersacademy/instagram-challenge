require "rails_helper"

feature "comments" do

  let!(:user1){ User.create(email: "test@test.com", password: "123456") }
  let!(:post1){ Post.create(description: "visit", location: "Parliament in Budapest, Hungary", image_file_name: "photo_01.jpg") }

  context "logged in" do

    before do
      sign_in
      visit "/posts"
    end

    context "add comment" do

      scenario "user can add a comment to a post" do
        visit_post(post1)
        click_link("add comment")
        expect(current_path).to eq "/posts/#{post1.id}/comments/new"

        add_comment(post: post1)
        expect(page).to have_css("div#yield", text: "nice photo, like it")

      end

      scenario "user can add more than 1 comments to a post"
    end

    context "edit comment" do

    end

    context "delete comment" do

    end

  end


end
