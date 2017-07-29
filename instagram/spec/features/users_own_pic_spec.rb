


require "rails_helper"


RSpec.feature "User Pictures", type: :feature do

  before do
    visit '/'
    sign_up
    User.first.pictures.create(caption: "hashtag").save
  end

  scenario "user can delete their own pics" do
    visit 'users/show'
    click_on "Delete Picture"
    expect(page).to have_content("Picture gone!")
    expect(page).to_not have_content("hashtag") # this might be too generic.
  end

  # scenario "user can view a single picture" do
  #   visit 'users/show'
  #   click_on 'View picture'
  #   expect()
  # end

end
