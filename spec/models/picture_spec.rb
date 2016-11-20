require 'rails_helper'

RSpec.describe Picture, type: :model do

  subject(:picture) {described_class.create(comment: "Love this image!")}

  it "adds an image to the picture" do
    add_image_and_save
    expect(picture.image_identifier).to eq("duck.jpg")
  end

  it "requires an image" do
    picture2 = Picture.new(comment: "Love this image!")
    expect{picture2.save}.not_to change{Picture.count}
  end

  it "adds an optional comment" do
    expect(picture.comment).to eq("Love this image!")
  end

  it "doesn't allow comments over 240 characters" do
    picture.comment = "6fIm6DQuupE7Fh8oYOoPkeFOIJGCMpC1e80RKTG9N5ibTUKMEOe8191FSB4fvtPkVH9HV4P2snkQLtYu6LktNa4wmzbfkmVkRZxTF8q2qK5ttiL8zn1jHmfEJa0QibINlivnYD2ZgAWGP5TI9XIqlqk9nfYTX4MlQfKfOPSiyjGovy1z0YpSrMNRQwLVmJvjgAUlxgnnAI9TsVun4TqeUcuC5W3nKlTpuolXjw3ZCb8CcFoL64juwbzaB1"
    expect{add_image_and_save}.not_to change{Picture.count}
  end

end
