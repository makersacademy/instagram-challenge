require 'rails_helper'

describe Post, type: :model do
  it { is_expected.to belong_to(:user) }

  it 'image is not allowed to be empty' do
    image = Post.new(description: "Nice", image: "")
    expect(image).to have(1).error_on(:image)
  end
end
