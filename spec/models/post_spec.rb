require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }
  it { should belong_to :user }

  it 'posts have pictures and text body' do
    user = create(:user)
    post = Post.new(image: File.new(Rails.root + 'spec/support/test_image.jpeg'))
    post.body = "test image"
    post.user_id = user.id
    post.save
    expect(post).to be_valid
  end
end
