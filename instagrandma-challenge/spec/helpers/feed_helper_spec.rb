require 'rails_helper'
# Specs in this file have access to a helper object that includes
# the FeedHelper. For example:
#
# describe FeedHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# # end
# RSpec.describe FeedHelper, type: :helper do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

def make_doggo
  visit '/feed'
  fill_in('image[title]', :with => "It a dog")
  fill_in('image[location]', :with => "doggo.jpg")
  attach_file('image[snappysnap]', 'app/assets/images/doggo.jpg')
  click_button('Create Image')
end
