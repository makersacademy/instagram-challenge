describe User do
  context 'should have many post comments' do
    it { is_expected.to have_many :post_comments }
  end
end
