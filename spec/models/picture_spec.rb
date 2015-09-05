require 'spec_helper'

describe Picture, type: :model do
  it { is_expected.to have_many :comments }

  it 'has a dependent relationship with comments' do
    pic = create(:picture)
    pic.comments.create(thoughts: "this is great")
    expect{ pic.destroy }.to change{ Comment.count }
  end
end



