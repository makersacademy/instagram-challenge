require 'rails_helper.rb'

feature 'Create posts' do
  scenario 'new post is created and viewed' do
    create_post
    expect(page).to have_content("squidward")
    expect(page).to have_content("#octopus")
    expect(page).to have_css("img[src*='octopus.jpg']")
  end
end
