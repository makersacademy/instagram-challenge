require 'rails_helper'

describe Experience, type: :model do
  it { should belong_to(:user) }

  it 'is not valid without a photo' do
    expereince = Experience.new(description: 'No image')
    expect(expereince).to have(1).error_on(:image)
    expect(expereince).not_to be_valid
  end
end
