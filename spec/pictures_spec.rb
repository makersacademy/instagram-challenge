require 'rails_helper'

describe Picture, type: :model do
  it "should have description" do
    pic = Picture.new(description: "first")
    expect(pic.description).to eq "first"
  end
end
