require 'rails_helper'

RSpec.describe Picture, type: :model do
  pending
  it {  is_expected.to be }
  
  it 'should not save picture without image attached' do
  end
  
  it 'should save a picture ' do
    
    expect { Picture.create(caption: "The Sea").save }.to change { Picture.all.length }.by(1)
  end
  
end
