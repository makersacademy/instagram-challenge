require 'rails_helper'

RSpec.describe "pictures/index", type: :view do
  before(:each) do
    assign(:pictures, [
      Picture.create!(
        imgURL: 'https://images.pexels.com/photos/440731/pexels-photo-440731.jpeg?h=350&auto=compress&cs=tinysrgb',
        description: 'One awesome green field'
      ),
      Picture.create!(
        imgURL: 'https://images.pexels.com/photos/440731/pexels-photo-440731.jpeg?h=350&auto=compress&cs=tinysrgb',
        description: 'One awesome green field'
      )
    ])
  end

end
