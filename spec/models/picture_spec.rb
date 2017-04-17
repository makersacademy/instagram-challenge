require 'spec_helper'

describe Picture, type: :model do

  it { is_expected.to belong_to :user }
  it { is_expected.to have_many :comments }
  it { is_expected.to have_many :likes }
  it { is_expected.to have_attached_file(:image)}
  it { is_expected.to validate_attachment_content_type(/\Aimage\/.*\Z/)}
end
