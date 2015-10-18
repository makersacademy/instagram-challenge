require 'rails_helper'

describe Comment, :type => :model do
  it 'is invalid if comment is empty' do
    comment = Comment.new(content: '')
    expect(comment).to have(1).error_on(:content)
  end
end
