require 'rails_helper'

describe Comment, type: :model do

  it {is_expected.to belong_to(:user) }

  it {is_expected.to belong_to(:post) }

  it 'is not valid if left blank' do
    comment = Comment.new(body: '')
    expect(comment).to have(1).error_on(:body)
    expect(comment).not_to be_valid
  end
end
