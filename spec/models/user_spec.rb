require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:posts).dependent(:destroy) }

  it { is_expected.to have_many :comment_posts }

end
