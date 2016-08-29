require 'rails_helper'

RSpec.describe Feed, type: :model do

  it { is_expected.to belong_to :user }
  it { is_expected.to have_many :photos }

end
