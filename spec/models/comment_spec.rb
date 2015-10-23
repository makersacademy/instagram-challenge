require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to belong_to :photo }
  it { is_expected.to have_many :comment_likes }
end
