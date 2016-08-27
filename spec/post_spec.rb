require "rails_helper"

describe Post do

  it { should have_attached_file(:image) }
  it { should validate_attachment_presence(:image) }
  it { should validate_attachment_content_type(:image).
                allowing('image/png', 'image/gif').
                rejecting('text/plain', 'text/xml') }
end
