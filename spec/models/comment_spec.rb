require 'spec_helper'

describe Comment, type: :model do
  it { should belong_to(:photo) }

  it 'comment must be provided' do
    comment = Comment.new(message: '')
    expect(comment).to have(1).error_on(:message)
    expect(comment).not_to be_valid
  end
end