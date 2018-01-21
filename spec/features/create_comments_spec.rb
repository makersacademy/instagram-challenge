require 'rails_helper'

RSpec.feature "Creating comments", type: :feature do

  before(:each) do
    create_crepe_post
  end

  scenario "Adding comments to a post" do
    expect{ create_comment(comment: "Yummmmm! :) ") }.to change{ Comment.count }.by 1
    expect(current_path).to eq('/posts/1')
    expect(page).to have_content("Yummmmm! :) ")
  end
end
