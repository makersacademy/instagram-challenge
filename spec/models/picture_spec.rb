require 'rails_helper'

RSpec.describe Picture, type: :model do
  pending
  it {  is_expected.to be }
  
  it 'should not save picture without image attached' do
    pending
  end
  
  it 'should save a ' do
    pending
    Picture.create()
    expect(Picture.all.length).to increase_by(1)
  end
  
end
