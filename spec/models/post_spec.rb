require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }

  describe '#caption' do
    it 'validates presence' do
      record = Post.new
      record.caption = ''
      record.valid?
      expect(record.errors[:caption]).to include("can't be blank")
    end
  end
end
