require 'rails_helper'

RSpec.describe "pictures/show", type: :view do
  before(:each) do
    @picture = assign(:picture, Picture.create!(
      imgURL: 'https://images.pexels.com/photos/440731/pexels-photo-440731.jpeg?h=350&auto=compress&cs=tinysrgb',
      description: 'One awesome green field'
    ))
  end

end
