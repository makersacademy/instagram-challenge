require "rails_helper"

feature "adding likes" do

  before(:each) do
    signup
    upload_image
  end

  scenario "can like own and others' images" do
    find('.image-link').click
    click_link 'Like'
    expect(page).to have_content '1 like'
    click_link 'Sign out'
    signup email: 'other@test.com', handle: 'goodbyeworld'
    find('.image-link').click
    click_link 'Like'
    expect(page).to have_content '2 likes'
  end

  scenario 'can only like images once' do
    find('.image-link').click
    click_link 'Like'
    expect(page).not_to have_link 'Like'
  end

end
