require 'rails_helper'

RSpec.describe Picture, type: :model do
  let(:user) { User.create email: 'testuser@email.com', password: "password", password_confirmation: "password" }

  it { should belong_to :user }

  it { should validate_presence_of :user }

  it { should validate_presence_of :title }

  it { should have_attached_file :image }

  it { should validate_attachment_presence :image }

  it { should validate_attachment_size(:image).
                less_than(1.megabyte) }

  it { should validate_attachment_content_type(:image).
                allowing('image/png', 'image/gif').
                rejecting('text/plain', 'text/xml') }
end
