require 'spec_helper'

describe Picture, type: :model do
  it { is_expected.to have_many :comments }
  it { is_expected.to have_many :likes }
  it { is_expected.to belong_to :user }

  it 'has a dependent relationship with comments' do
    pic = create(:picture)
    pic.comments.create(thoughts: "this is great")
    expect { pic.destroy }.to change { Comment.count }
  end

  it 'has a dependent relationship with likes' do
    pic = create(:picture)
    pic.likes.create
    expect { pic.destroy }.to change { Like.count }
  end

  describe 'it calculates the timestamp for each picture' do
    it 'calculates a timestamp for a moment ago' do
      pic = create(:picture)
      expect(pic.timestamp).to eq("a moment ago")
    end

    it 'calculates a timestamp for a few minutes ago' do
      pic = create(:picture)
      Timecop.freeze(Time.now + 120)
      expect(pic.timestamp).to eq("2m ago")
    end

    it 'calculates a timestamp for a few hours ago' do
      pic = create(:picture)
      Timecop.freeze(Time.now + 7200)
      expect(pic.timestamp).to eq("2h ago")
    end

    it 'calculates a timestamp for a few days ago' do
      pic = create(:picture)
      Timecop.freeze(Time.now + 172800)
      expect(pic.timestamp).to eq("2d ago")
    end
  end

end



