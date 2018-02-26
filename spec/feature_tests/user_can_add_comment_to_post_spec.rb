require 'rails_helper'
RSpec.describe "Creating comments", :type => :feature do

  before do
    @post = create(:post)
  end

  feature 'Adding a comment' do
    scenario ' user cannot add comment if not signed in' do
      add_comment("hey")
      expect(page.current_path).to eq '/users/sign_in'
    end
  end

  feature 'Adding a comment' do

    before do
      login
    end

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
