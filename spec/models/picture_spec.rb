require 'rails_helper'

RSpec.describe Picture, type: :model do

  subject(:picture) { described_class.new(
      id: 1,
      image: 'fakepicture.jpg',
    )
  }

  it 'is not valid without an image' do
    picture.image = nil
    expect(picture).to_not be_valid
  end

end
