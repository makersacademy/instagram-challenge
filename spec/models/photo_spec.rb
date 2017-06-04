require 'rails_helper'

RSpec.describe Photo, type: :model do
  it 'can display local time and date' do
    new_photo = Photo.new(created_at: Time.now)
    expect(new_photo.local_time_stamp).to eq Time.now.strftime('%H:%M, %d/%m/%Y')
  end
end
