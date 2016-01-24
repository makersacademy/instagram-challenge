require 'spec_helper'

describe Post, type: :model do
  it { is_expected.to have_many :comments }

  it 'is not valid with a name of less than three characters' do
    post = Post.new(comment: "M")
    expect(post).to have(1).error_on(:comment)
    expect(post).not_to be_valid
  end

end
