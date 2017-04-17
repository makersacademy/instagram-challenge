require 'spec_helper'

describe Comment, type: :model do
 
  it 'is not valid with blank thoughts' do
    comment = Comment.new
    expect(comment).to have(1).error_on(:thoughts)
    expect(comment).not_to be_valid
  end
end