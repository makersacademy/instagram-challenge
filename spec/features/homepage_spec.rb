RSpec.feature "Homepage" do
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

  it "has a link to upload a photo" do
    sign_up
    visit "/"
    click_link("Upload")
    expect(current_path).to eq "/photos/new"
  end

  it "has a link to a user's profile" do
    sign_up
    visit "/"
    click_link("Profile")
    expect(page).to have_current_path "/profiles/dangermouse"
  end

  it "has a link to the user's feed" do
    sign_up
    visit "/"
    click_link("Feed")
    expect(page).to have_current_path "/feed/dangermouse"
  end
end
