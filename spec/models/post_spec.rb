require 'spec_helper'

describe Post, type: :model do
  it { is_expected.to have_many :comments }
  it 'is not valid with a caption of less than three characters' do
    post = Post.new(caption: "il")
    expect(post).to have(1).error_on(:caption)
    expect(post).not_to be_valid
  end

  describe '#average_hotness' do
    context 'no comments' do
      it 'returns "N/A" when there are no comments' do
        post = Post.create(caption: "illing")
        expect(post.average_hotness).to eq 'N/A'
      end
    end
  end

end

