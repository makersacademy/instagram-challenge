require 'rails_helper'

describe Post, type: :model do
  it { is_expected.to have_many :comments }

  context 'image upload' do
    let(:txt_image) {Post.create(:image => File.new(Rails.root + 'spec/fixtures/files/Rock.jpg'))}

    it {is_expected.to be_valid}

  end

end


