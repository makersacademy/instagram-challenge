require 'spec_helper'

describe Picture, :type => :model do

  it 'description can not be left blank' do
    picture = Picture.new(descr: '')
    expect(picture).to have(1).error_on(:descr)
    expect(picture).not_to be_valid
  end

  it { is_expected.to have_many :comments }
  
end
