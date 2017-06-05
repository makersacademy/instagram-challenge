require 'rails_helper'

RSpec.describe Photo, type: :model do

  it 'should have a description' do
    photo = create(:photo)
    expect(photo.description).to eq("MyText")
  end

  it{ should belong_to(:user) }
  it{ should have_many(:comments)}


  it 'has a formatted time and date' do
    photo = create(:photo)
    expect(photo.local_time_stamp).to eq "#{Time.now.strftime('%H:%M')}"
    expect(photo.local_date_stamp).to eq "#{Time.now.strftime('%d/%m/%Y')}"
  end

end
