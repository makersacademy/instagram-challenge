require 'rails_helper'

describe Picture, type: :model do
  it { should have_attached_file(:image) }

  it { should validate_attachment_presence(:image) }

  it { should validate_attachment_content_type(:image).
              allowing('image/png', 'image/gif').
              rejecting('text/plain', 'text/xml') }

  it { is_expected.to have_many :comments }
  it { is_expected.to have_many :likes }
  it { is_expected.to belong_to :user }
end
