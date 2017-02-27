require 'rails_helper'

RSpec.describe User, type: :model do

  context 'associations' do
    it 'should have many posts and comments' do
      should have_many(:posts)
      should have_many(:comments)
    end

    it { is_expected.to have_many :commented_posts }
  end
end
