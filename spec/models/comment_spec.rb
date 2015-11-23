require 'spec_helper'

# RSpec.describe Comment, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Comment, type: :model do

  it { is_expected.to belong_to :picture }

  it { is_expected.to belong_to :user }

end
