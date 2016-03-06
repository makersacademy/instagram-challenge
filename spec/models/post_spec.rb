require 'rails_helper'

describe Post, type: :model do
  it { is_expected.to belong_to(:user).dependent(:destroy) }
  it { should have_attached_file(:image) }
  it { should validate_attachment_presence(:image) }
  it do
    should validate_attachment_content_type(:image)
      .allowing('image/png', 'image/gif')
      .rejecting('text/plain', 'text/xml')
  end
  it { should validate_attachment_size(:image).less_than(2.megabytes) }
end
