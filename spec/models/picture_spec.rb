require 'rails_helper'

describe Picture do
  it { should have_attached_file(:image) }
  it { should validate_attachment_presence(:image) }
  it { should validate_attachment_content_type(:image).
              allowing('image/jpg', 'image/gif').
              rejecting('text/plain', 'text/xml') }
end
