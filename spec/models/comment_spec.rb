require 'rails_helper'

RSpec.describe Comment, type: :model do

  subject(:comment) { described_class.new(
      id: 1,
      text: 'this is a comment',
    )
  }

  it 'is not valid without text' do
    comment.text = nil
    expect(comment).to_not be_valid
  end

end
