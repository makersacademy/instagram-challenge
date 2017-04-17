describe Post do
  context 'a post belongs to a user' do
    it {should belong_to(:user)}
  end
end
