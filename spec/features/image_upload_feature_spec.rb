require "rails_helper"

feature "Image upload" do

  before(:each) do
    signup
    click_link "Upload image"
  end

  scenario "Images can be uploaded" do
    attach_file 'image[image]', Rails.root + "spec/assets/success.jpg"
    fill_in 'image[description]', with: "test caption"
    click_button "Create Image"
    expect(page).to have_css '.image-div'
  end

  scenario "Can't submit blank file field" do
    click_button('Create Image')
    expect(page).to have_content 'Incorrect attachment'
  end

  scenario "Can't submit invalid file type" do
    attach_file 'image[image]', Rails.root + "spec/assets/failure.docx"
    fill_in 'image[description]', with: "should not work"
    click_button "Create Image"
    expect(page).to have_content 'Incorrect attachment'
  end
end
