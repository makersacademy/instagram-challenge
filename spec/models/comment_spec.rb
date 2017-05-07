require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'Is invalid if blank' do
    comment = Comment.new(text: "")
    expect(comment).to have(1).error_on(:text)
  end
end
