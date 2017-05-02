require 'rails_helper'

describe Comment, type: :model do
  comment = Comment.new

  it 'belongs to user' do
    expect(comment).to belong_to(:user)
  end

  it 'belongs to picture' do
    expect(comment).to belong_to(:picture)
  end

end
