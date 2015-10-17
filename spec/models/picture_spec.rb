require 'rails_helper'

# RSpec.describe Picture, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Picture, type: :model do

  it { is_expected.to have_many :comments }

end
