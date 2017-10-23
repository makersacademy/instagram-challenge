require 'rails_helper'

RSpec.describe Image, type: :model do
  it 'can store an image location' do
  @new_image_db_entry = Image.create(title:'doggo', location: 'doggo.jpg')
  expect(@new_image_db_entry.location).to eq 'doggo.jpg'
  end
end
