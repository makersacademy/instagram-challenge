


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

  scenario "user can view a single picture" do
    User.first.pictures.create(caption: "pictwo").save
    visit 'users/show'
    click_on 'View Picture 2'
    expect(page).to have_content("pictwo")
    expect(page).to_not have_content("hashtag")
  end

  scenario "user can edit a picture" do
    visit 'users/show'
    click_on 'Edit Picture 1'
    fill_in 'picture_caption', with: "Change me"
    click_on "Update"
    expect(page).to have_content("Picture edited!")
  end


end
