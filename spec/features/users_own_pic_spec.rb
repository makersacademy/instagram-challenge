


require "rails_helper"


RSpec.feature "User's personal pictures", type: :feature do

  before do
    visit '/'
    sign_up
    create_pic
    visit 'users/1'
  end

  scenario "user can delete their own pictures" do
    click_on "Delete Picture"
    expect(page).to have_content("Picture gone!")
    expect(page).to_not have_content("hashtag") # this might be too generic.
  end

  scenario "user can view a single picture" do
    create_pic(caption: "pictwo")
    @picture = Picture.all[1]
    find("a[href='/pictures/#{@picture.id}']").click
    expect(page).to have_content("pictwo")
    expect(page).to have_css("img[src*='surf']")
    expect(page).to_not have_content("hashtag")
  end

  scenario "user can edit a picture" do
    click_on 'Edit Picture'
    fill_in 'picture_caption', with: "Change me"
    click_on "Update"
    expect(page).to have_content("Picture edited!")
  end

  context "if another user wants to edit or delete your picture" do
    scenario "they cannot" do
      sign_out
      sign_up(username: "anon", email: "anon@gmail.com", password: "654321", password_confirmation: "654321")
      visit "/users/1"
      expect(page).to_not have_content("Delete Picture")
      expect(page).to_not have_content("Edit Picture")
    end
  end

  context "invalid submission" do
    scenario "user submits pic without file" do
    click_on "Post Picture"
    fill_in "picture_caption", with: "bad submission"
    click_on "Post"
    expect(page).not_to have_content("bad submissions")
    expect(page).to have_content "Image can't be blank"
  end
end


end
