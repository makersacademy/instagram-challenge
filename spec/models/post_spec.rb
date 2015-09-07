require 'rails_helper'

describe Post, type: :model do
  it { is_expected.to have_many(:comments).dependent(:destroy) }
  it { is_expected.to validate_presence_of :image }
  it { is_expected.to validate_presence_of :user }
  it { is_expected.to belong_to :user }

  it 'is not valid to create post without image' do
    post = Post.new(caption: 'Great')
    expect(post).to have(1).error_on(:image)
    expect(post).not_to be_valid
  end

  it 'is valid with images' do
    post = create(:post)
    expect(post).to be_valid
  end

  context 'Creating posts without user' do
    it 'is not valid to create post without being signed in' do
      post = Post.create(caption: '#life', image_file_name: 'spec/asset_spec/images/testing.png')
      expect(post).not_to be_valid
    end

    it 'is valid to create post if signed in' do
      user = create(:user)
      post = Post.create(caption: '#life', image_file_name: 'spec/asset_spec/images/testing.png', user: user)
      expect(post).to be_valid
    end
  end

end
