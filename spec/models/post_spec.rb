require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to belong_to :project }
  it { is_expected.to have_many(:comments).dependent(:destroy)}
end
