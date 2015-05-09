require 'rails_helper'

describe Image, type: :model do

  it { is_expected.to have_many :comments }

  it { is_expected.to have_many :likes }

end
