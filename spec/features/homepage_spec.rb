RSpec.feature "Homepage" do
  it "shows the app name" do
    visit "/"
    expect(page).to have_content "YNSTAGRAM"
  end

  it "has a link to upload a photo" do
    visit "/"
    click_link("Upload")
    expect(current_path).to eq "/photos/new"
  end

  it "has a link to sign up" do
    visit "/"
    click_link("Register")
    expect(current_path).to eq "/users/sign_up"
  end

  it "has a link to sign up" do
    visit "/"
    click_link("Login")
    expect(current_path).to eq "/users/sign_in"
  end
end
