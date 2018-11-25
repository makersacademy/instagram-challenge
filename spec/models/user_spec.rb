describe User do

  before(:each) { @user = create(:user) }

  subject { @user }

  context 'associations' do
    it { should have_many(:posts) }
  end

  it { should respond_to(:name) }

  it "#name returns a string" do
    expect(@user.name).to match 'Test User'
  end
  it { should respond_to(:email) }

  it "#email returns a string" do
    expect(@user.email).to match 'test@example.com'
  end

end
