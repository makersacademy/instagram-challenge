require 'rails_helper'

RSpec.describe Comment, type: :model do

  it 'cannot be empty' do
    c = Comment.create(comment: '')
    expect(c).to have(1).error_on(:comment)
  end

  it { is_expected.to validate_length_of(:comment).is_at_most(255) }

end
