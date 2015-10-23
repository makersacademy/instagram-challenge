require 'rails_helper'

RSpec.describe Tag, type: :model do
  it { is_expected.to have_many :tagged_photos }
  it { is_expected.to have_many(:photos).through(:tagged_photos) }
end
