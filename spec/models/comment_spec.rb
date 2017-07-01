require 'rails_helper'

RSpec.describe Comment, type: :model do

  before(:each) { @comment = Comment.create(text: 'Lovely photo!') }

  it "has a comment" do
    expect(@comment.text).to match('Lovely photo!')
  end
end
