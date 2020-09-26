require 'rails_helper'

RSpec.describe "photos/show", type: :view do
  before(:each) do
    @photo = assign(:photo, Photo.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
