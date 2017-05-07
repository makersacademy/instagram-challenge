require 'rails_helper'

describe Comment, type: :model do

  context 'associations' do
    it 'should belong to a user' do
      should belong_to(:user)
    end
    it 'should belong to a picture' do
      should belong_to(:picture)
    end
  end

end
