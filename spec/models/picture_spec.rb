require 'rails_helper'

describe Picture, type: :model do

  context 'associations' do
    it 'should belong to a user' do
      should belong_to(:user)
    end
    it 'should have many comments' do
      should have_many(:comments)
    end
    it 'should have many likes' do
      should have_many(:likes)
    end
  end

end
