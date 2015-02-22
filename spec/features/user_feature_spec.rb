require 'rails_helper'

context "user not signed in and on the homepage" do

  it "should not see 'sign out' link" do
    visit('/')
    expect(page).not_to have_link('Sign out')
  end
end

context "user signed in on the homepage" do


  it "should see 'sign out' link" do
    sign_in
    visit('/')
    expect(page).to have_link('Sign out')
  end

end