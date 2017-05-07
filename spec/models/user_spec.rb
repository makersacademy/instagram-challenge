describe User, type: :model do
  describe 'Associations' do
    it { should have_many(:experiences) }
  end
end

# context 'user validations at sign up' do
#   scenario 'should not be able to sign up with an existing username' do
#     sign_up
#     click_link 'Sign out'
#     click_link 'Sign up'
#     expect {sign_up(email:'emmpak@makers.com') }.not_to change {User.count}
#   end
#
#   scenario 'should not be able to registe without a username' do
#     expect {sign_up(username:'') }.not_to change {User.count}
#   end
# end
