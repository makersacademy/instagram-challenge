require 'rails_helper'

feature "Showing single post" do
  scenario "Showing a single post view" do
    create_crepe_post
    visit "/"
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(current_path).to eq('/posts/1')
  end
end
