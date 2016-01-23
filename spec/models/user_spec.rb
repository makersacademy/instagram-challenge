require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :comments }
  it { should have_many :pictures }
  it { should have_many :likes }
  it { should have_many :liked_pictures }

end
