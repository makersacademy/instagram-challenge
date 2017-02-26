describe User do

  it { is_expected.to have_many(:posts).dependent(:destroy) }

  it { is_expected.to have_many(:comments).dependent(:destroy) }

  it { is_expected.to have_many :liked_posts}

end
