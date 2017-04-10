require 'rails_helper'

describe Like, type: :model do
  like = Like.new

  it 'belongs to user' do
    expect(like).to belong_to(:user)
  end

  it 'belongs to picture' do
    expect(like).to belong_to(:picture)
  end

end
