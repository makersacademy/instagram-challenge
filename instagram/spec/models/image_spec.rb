require 'rails_helper'

describe Image, type: :model do
  it 'is not valid with a caption of less than three characters' do
    image = Image.new(caption: 'kfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkf')
    expect(image).to have(1).error_on(:caption)
    expect(image).not_to be_valid
  end
end
