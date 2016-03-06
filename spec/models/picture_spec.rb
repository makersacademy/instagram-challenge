require 'rails_helper'

describe Picture, type: :model do
  it { should have_attached_file(:image) }

  it { should validate_attachment_content_type(:image).allowing('image/png', 'image/gif') }

  it { should belong_to(:user) }
end