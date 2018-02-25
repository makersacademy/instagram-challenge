require 'rails_helper'
RSpec.describe "Creating comments", :type => :feature do
  before() do
    @post = create(:post)
  end
  feature 'Adding a comment' do
    scenario 'can add comment to a post' do
      add_comment("Cool Cat")
      expect(page).to have_content "Cool Cat"
    end
    scenario 'add multiple comments' do
      add_comment("Cool Cat")
      add_comment("Not so cool cat")
      expect(page).to have_content "Cool Cat"
      expect(page).to have_content "Not so cool cat"
    end
  end
end
