require 'rails_helper'

describe Like, type: :model do

  context 'associations' do
    it 'should belong to a picture' do
      should belong_to(:picture)
    end
    it 'should belong to a user' do
      should belong_to(:user)
    end
  end

end
