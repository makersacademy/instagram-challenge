require 'rails_helper.rb'

feature 'View posts' do
  scenario 'all posts can be viewed' do
    create_post
    create_second_post
    visit ('/')
    expect(page).to have_css("img[src*='octopus.jpg']")
    expect(page).to have_css("img[src*='gp-octopus.jpg']")
  end
end
