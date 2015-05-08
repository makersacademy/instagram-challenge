require 'rails_helper'

describe Post, type: :model do
  it { is_expected.to have_many :comments }

  it 'is not valid with a title less than three characters' do
    post = Post.new(title: 'Aw')
    expect(post).to have(1).error_on(:title)
    expect(post).not_to be_vaild
  end
end
