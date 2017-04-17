describe Photo, type: :model do
  it { is_expected.to have_attached_file :gram }
  it { is_expected.to validate_attachment_presence :gram }
  it { is_expected.to validate_attachment_content_type(:gram).
                                allowing('image/png', 'image/jpg').
                                rejecting('text/plain', 'text/xml') }
end
