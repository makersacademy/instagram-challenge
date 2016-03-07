require 'rails_helper'

RSpec.describe Like, type: :model do
    it { should belong_to :photo }
end
