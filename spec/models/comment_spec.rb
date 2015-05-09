require 'spec_helper'
require 'rails_helper'

describe Comment, type: :model do

  it { should belong_to(:image) }

  it { should belong_to(:user) }

  it 'is not valid with less than three characters' do
    comment = Comment.new(comment: "hi")
    expect(comment).to have(1).error_on(:comment)
    expect(comment).not_to be_valid
  end
end
