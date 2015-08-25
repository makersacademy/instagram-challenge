require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to(:photo) }
  
  it "should add photo to database" do
    user = create(:user)
    photo = user.photos.create(name: 'testcat', image_file_name: "catgrumps.jpg")
    expect(photo).to eq Photo.find_by(name: 'testcat')
  end
  


end
