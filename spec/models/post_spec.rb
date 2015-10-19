require 'rails_helper'

describe Post, type: :model do
  it { is_expected.to have_many :comments }
end

describe Post, :type => :model do
  it 'is not valid with a name of less than three characters' do
    post = Post.new(name: "Bi")
    expect(post).to have(1).error_on(:name)
    expect(post).not_to be_valid
  end
end
