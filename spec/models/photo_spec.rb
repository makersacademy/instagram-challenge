require 'spec_helper'

describe Photo, type: :model do

  context 'relationship with comments' do
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end
end