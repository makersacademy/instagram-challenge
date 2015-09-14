require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to belong_to :picture }

  it { is_expected.to belong_to :user }

  it { is_expected.to validate_presence_of :user }

  it { is_expected.to validate_presence_of :picture }

  xit 'can be deleted'
    # Use FactoryGirl for a Comment factory


end
