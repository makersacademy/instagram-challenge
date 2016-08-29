require 'spec_helper'

describe Comment, type: :model do

  it { should belong_to(:photograph) }
  it { should belong_to(:user) }

  it 'is not valid with a comment of less than three characters' do
    comment = Comment.new(comment: "zz")
    expect(comment).to have(1).error_on(:comment)
    expect(comment).not_to be_valid
  end

end
