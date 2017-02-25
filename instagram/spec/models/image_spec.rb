require 'rails_helper'

describe Image, type: :model do
  it 'is not valid with a caption of less than three characters' do
    image = Image.new(caption: 'kfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkf', image: File.new(Rails.root + 'public/system/images/images/000/000/001/original/AAEAAQAAAAAAAAjkAAAAJDY3MmYxNjQ2LWJhNjQtNGUzZC05OTNlLTFiNWEyOGE0ZjMxOQ.jpg'))
    expect(image).to have(1).error_on(:caption)
    expect(image).not_to be_valid
  end

  it "is not valid unless it has a image" do
    image = Image.new(caption:'Test')
    expect(image).to have(1).error_on(:image)
  end

end
