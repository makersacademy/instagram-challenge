require 'rails_helper'

RSpec.describe Photo, type: :model do
  it { is_expected.to belong_to :user}
  it { is_expected.to have_many :likes}
end
