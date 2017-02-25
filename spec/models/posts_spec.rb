require 'rails_helper'

describe Post do

  it { is_expected.to have_many(:comments).dependent(:destroy) }

  it {is_expected.to belong_to(:user).dependent(:destroy) }

end
