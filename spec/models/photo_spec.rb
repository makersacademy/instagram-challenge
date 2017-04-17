require 'rails_helper'

RSpec.describe Photo, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it { is_expected.to have_many :comments }
  it { is_expected.to belong_to :user }
end
