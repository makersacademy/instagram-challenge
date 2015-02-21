require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PicturesHelper. For example:
#
# describe PicturesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PicturesHelper, type: :helper do

  def add_picture
    visit '/pictures'
    click_link 'Add a picture'
    attach_file('Image', "#{Rails.root}/spec/support/uploads/derp.png")
    click_button 'Create Picture'
  end 

end
