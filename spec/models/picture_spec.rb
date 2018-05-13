require 'rails_helper'

RSpec.describe Picture, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  
  it "has no pictures by default" do
    expect(Picture.count).to eq 0
  end

  it "does not save without a user" do
    picture = Picture.create({link: 'http://www.example.com'})
    picture.save
    expect(Picture.count).to eq 0
  end

  it "saves a valid post" do
    user = User.create(email: 'example@example', password: 123456)
    picture = Picture.create({link: 'http://www.example.com', user: user})
    picture.save
    expect(Picture.count).to eq 1
  end
end
