require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'associations' do
    it 'belongs to user and post' do
      should belong_to(:user)
      should belong_to(:post)
    end
  end
end
