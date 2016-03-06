require 'rails_helper'

describe Comment, type: :model do

  it { is_expected.to belong_to :photo }


end
