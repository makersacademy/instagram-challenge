require 'spec_helper'

describe Photo, type: :model do

  context 'relationship with comments' do
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end

  context 'photo has many likes' do
    it { is_expected.to have_many(:likes).dependent(:destroy) }
  end
end