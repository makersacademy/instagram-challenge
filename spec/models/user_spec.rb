require 'rails_helper'

describe User, type: :model do

  context 'associations' do
    it 'should have one to many association with adventures' do
      should have_many(:travelgrams)
    end

    it { is_expected.to have_many :commented_travelgrams }
  end


end
