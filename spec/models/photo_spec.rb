require 'spec_helper'

  describe Photo, type: :model do

    it { is_expected.to have_many :comments }

    it 'is not valid without a description' do
      photo = Photo.new(title: '')
      expect(photo).to have(1).error_on(:title)
      expect(photo).not_to be_valid
    end

  end

