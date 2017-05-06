require 'rails_helper'

describe Picture, type: :model do

  it { should belong_to(:user) }

end
