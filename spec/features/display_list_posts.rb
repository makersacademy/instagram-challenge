require 'rails_helper'

feature 'Index displays a list of posts' do
  scenario 'the index a list of posts' do
    create(:post, caption: "Me and my friends")
    create(:post, caption: "Me and my family")

    visit '/'
    expect(page).to have_content("Me and my friends")
    expect(page).to have_content("Me and my family")
    expect(page).to have_css("img[src*='testimage']")
  end
end
