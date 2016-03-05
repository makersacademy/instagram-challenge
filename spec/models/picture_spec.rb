describe Picture do
  it { should have_attached_file(:image) }

  it { should validate_attachment_content_type(:image) }
end