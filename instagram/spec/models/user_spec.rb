require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :images}
  it { should have_many :comments}
  it { is_expected.to have_many :commented_images }
end
