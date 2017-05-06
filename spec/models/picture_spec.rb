require 'rails_helper'
RSpec.describe Picture, type: :model do

  # it { should belong_to(:user) }

  it 'is not valid with a name of less than two characters' do
    picture = Picture.new(name: 'A')
    expect(picture).to have(1).error_on(:name)
    expect(picture).not_to be_valid
  end

  # it 'is not valid unless it has a unique name' do
  #   user = User.create(email: "dog@dog.com", password: 'password123')
  #   user.pictures.create(name: "Moe's tavern")
  #   picture = user.pictures.new(name: "Moe's tavern")
  #   expect(picture).to have(1).error_on(:name)
  # end

end
