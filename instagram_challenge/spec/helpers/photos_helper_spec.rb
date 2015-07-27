require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PhotosHelper. For example:
#
# describe PhotosHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PhotosHelper, type: :helper do
  def sign_up
      visit '/'
      click_link 'Sign up'
      fill_in 'Email', with: 'test@email.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'
    end
end
