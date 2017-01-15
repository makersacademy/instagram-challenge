require 'rails_helper'

feature "commenting" do
  include Helpers

  picture_1 = {
    filepath: "./spec/assets/test1.jpg",
    description: "where do tests go?"
  }

  before do
    add_picture(picture_1)
  end

  scenario "I want to add a comment uder a picture" do

  end

end
