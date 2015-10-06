require 'spec_helper'

describe Picture, type: :model do
  it { is_expected.to have_many :comments }
  it { is_expected.to have_many :likes }
  it { is_expected.to belong_to :user }

  it 'has a dependent relationship with comments' do
    pic = create(:picture)
    pic.comments.create(thoughts: "this is great")
    expect { pic.destroy }.to change { Comment.count }
  end

  it 'has a dependent relationship with likes' do
    pic = create(:picture)
    pic.likes.create
    expect { pic.destroy }.to change { Like.count }
  end

  it ''
end



