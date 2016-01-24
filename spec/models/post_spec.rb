require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to have_attached_file(:image) }

  it do
    is_expected.to validate_attachment_content_type(:image)
      .allowing('image/png', 'image/gif', 'image/jpg', 'image/jpeg')
      .rejecting('text/plain', 'text/xml', 'text/html')
  end
end
