require 'rails_helper'

RSpec.describe Ham, type: :model do
  it { is_expected.to be }

  subject { described_class.new }
  #
  # it "should save new ham" do
  #   ham = Ham.new(:title=>"fasdf", :text=>"sdffgfgh")
  #   found_ham = Ham.find(1)
  #   expect(found_ham).to include("sdffgfgh")
  # end

  # describe '#email' do
  #   it { should_not allow_value("blah").for(:email) }
  #   it { should allow_value("a@b.com").for(:email) }
  # end

  it "is valid with valid attributes" do
    subject.title = "something"
    subject.text = "some text"
    expect(subject).to be_valid
  end

  it "saves a new ham" do
    # subject.title = "something"
    # subject.text = "some text"
    # found_ham = Ham.find(1)
    # expect(Ham.find(1).text).to eq("some text")
    # @user = User.create
    # Ham :create, user_id: @user.id, item: { name: "name"}
    # expect(Ham.find(1).text).to eq("some text")
  end
end
