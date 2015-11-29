require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'a comment belongs to a user' do
    it {should belong_to(:user)}
  end
  context 'a comment belongs to a post' do
    it {should belong_to(:post)}
  end
end
