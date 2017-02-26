require 'rails_helper'

describe Comment, type: :model do

  context 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:image) }
  end

end
