require 'rails_helper'

describe Comment, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:experience) }
  end

  describe 'Database table' do
    it { is_expected.to have_db_column(:content).of_type(:text) }
  end
end
