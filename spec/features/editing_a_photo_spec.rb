RSpec.feature "Editing photos" do
  before do
    sign_up
    upload
    visit "/"
    click_first_photo
  end

  it "routes the user to the edit page" do
    within ".photo-admin" do
      first(:button).click
    end
    expect(current_path).to eq "/photos/#{Photo.last.id}/edit"
  end

  it "allows the user to edit the photo's description" do
    within ".photo-admin" do
      first(:button).click
    end
    fill_in "Description", with: "Emily is a chessmaster"
    click_button "Edit"
    expect(page).to have_no_content "Emily plays chess"
    expect(page).to have_content "Emily is a chessmaster"
  end

  it "allows the user to edit the photo's tags" do
    within ".photo-admin" do
      first(:button).click
    end
    fill_in "photo_tags", with: "catstagram"
    click_button "Edit"
    expect(page).to have_no_content "#catsofynstagram"
    expect(page).to have_content "#catstagram"
  end

  it "does not show an edit button to other users" do
    logout
    sign_up(username: "penfold",
            email: "penfold@mouse.com",
            password: "ohcrumbs",
            password_confirmation: "ohcrumbs")
    visit "/"
    click_first_photo
    expect(page).to have_no_css(".edit")
  end
end
