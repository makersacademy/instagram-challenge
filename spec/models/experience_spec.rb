require 'rails_helper'

describe Experience, type: :model do
  subject(:experience) { described_class.new }

  describe 'Associations' do
    it { should belong_to(:user) }
  end

  describe 'Database Table' do
    it { is_expected.to have_db_column(:description).of_type(:text) }
    it { is_expected.to have_db_column(:image_file_name).of_type(:string) }
    it { is_expected.to have_db_column(:image_content_type).of_type(:string) }
    it { is_expected.to have_db_column(:image_file_size).of_type(:integer) }
    it { is_expected.to have_db_column(:image_updated_at).of_type(:datetime) }
  end

  describe 'Validations' do
    it 'is not valid without a photo' do
      expereince = Experience.new(description: 'No image')
      expect(expereince).to have(1).error_on(:image)
      expect(expereince).not_to be_valid
    end
  end

  describe '#chronological' do
    it 'orders the experiences in chronological order' do
      user = create_user
      first_post = Experience.create(image: File.new("#{Rails.root}/spec/fixtures/wolf_creek.jpg"), user_id: user.id)
      second_post = Experience.create(image: File.new("#{Rails.root}/spec/fixtures/san_juan.jpg"), user_id: user.id)
      expect(experience.chronological).to eq [second_post, first_post]
    end
  end
end
