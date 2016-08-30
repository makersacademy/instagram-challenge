require 'spec_helper'

describe Comment, type: :model do

  it 'is not valid with a comment of more than 200 characters' do
    content = 'This comment is way, way, way too long, and so the validation should make this an invalid comment and raise an error to notifying the user to shorten their description content to a maximum of 200 characters.'
    comment = Comment.new(content: content)
    expect(comment).to have(1).error_on(:content)
    expect(comment).not_to be_valid
  end

end
