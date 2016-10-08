require "rails_helper"

feature "posts" do

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

    end

    context "edit post" do

    end

    context "delete post" do
      
    end

  end

end
