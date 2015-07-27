require 'rails_helper'

describe User do

  it { is_expected.to have_many :comments }

  it { is_expected.to have_many :pictures }

end
