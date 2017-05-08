require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'is invalid if it is left empty' do
    comment = Comment.new(comment: '')
    expect(comment).to have(1).error_on(:comment)
  end
end
