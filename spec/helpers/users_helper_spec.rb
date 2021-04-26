require 'rails_helper'

def sign_up
  visit "/"
  click_link "Sign Up"
  fill_in "user_username", with: "test_user"
  fill_in "user_password", with: "test_password"
  click_button "Submit"
end

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UsersHelper, type: :helper do
  pending "add some examples to (or delete) #{__FILE__}"
end
