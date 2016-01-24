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

end

def upload_photo(path: 'spec/fixtures/city.jpg')
  click_link 'Upload'
  attach_file "photo_image", path
  find('input[type=submit]').click
end
