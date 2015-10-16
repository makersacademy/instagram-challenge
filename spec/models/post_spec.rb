require 'rails_helper'

describe Post, type: :model do
  it { is_expected.to have_many :comments }

  it 'is not valid without user providing content' do
    post = Post.new(content: "")
    expect(post).to have(1).error_on(:content)
    expect(post).not_to be_valid
  end

end
