require 'rails_helper'


describe Post, type: :model do
  it { is_expected.to have_many(:comments).dependent(:destroy) }
  it { is_expected.to validate_presence_of(:image) }

  it 'is not valid to create post without image' do
    post = Post.new(caption: 'Great')
    expect(post).to have(1).error_on(:image)
    expect(post).not_to be_valid
  end

  it 'is valid with images' do
    post = create(:post)
    expect(post).to be_valid
  end
end
