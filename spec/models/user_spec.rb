require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new }

  xit "is valid with valid attributes" do
    subject.id = 1
    subject.first_name = "Chris"
    subject.last_name = "Gilbert"
    subject.username = "instachris"
    subject.email = "email@email.com"
    subject.password = "password"
    subject.created_at = Time.now
    subject.updated_at = Time.now
    expeect(subject).to be_valid
  end

  # it "is not valid without a name, email and password" do
  #   expect(subject).not_to be_valid
  # end
end
