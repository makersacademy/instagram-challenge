require 'rails_helper'

RSpec.describe Picture, type: :model do
  let(:user) { User.create email: 'testuser@email.com', password: "password", password_confirmation: "password" }

  it { is_expected.to belong_to :user }

  it { is_expected.to validate_presence_of :user }

  it { is_expected.to validate_presence_of :title }

  it { is_expected.to have_attached_file :image }

  it { is_expected.to validate_attachment_presence :image }

  it { is_expected.to validate_attachment_size(:image).
                less_than(1.megabyte) }

  it { is_expected.to validate_attachment_content_type(:image).
                allowing('image/png', 'image/gif').
                rejecting('text/plain', 'text/xml') }

  it { is_expected.to have_many :comments }
end
