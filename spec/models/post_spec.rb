require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }

  it 'Can create a new post' do
    post = Post.create(text: "Hello test!", photo: "pretend_photo.png")
    expect(post).to be_valid
  end

end
