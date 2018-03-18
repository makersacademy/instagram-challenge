require 'rails_helper.rb'

feature 'Create a post' do
  scenario 'Displays post created' do
    create_new_post
    expect(page).to have_current_path(/posts\/[0-9]+/)
    expect(page).to have_content "what a terrible picture"
  end

  scenario "Displays an error message when new post is invalid" do
    create_invalid_post
    expect(page).not_to have_content("what a terrible picture")
    expect(page).to have_content("Photo can't be blank")
  end
end
