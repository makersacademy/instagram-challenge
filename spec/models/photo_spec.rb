require 'rails_helper'

describe Photo, type: :model do

  it { should validate_presence_of(:image) }
  it { should validate_presence_of(:name) }
  it { should belong_to :user }
  it { should have_many :comments }
  it { should have_many :likes }

end
