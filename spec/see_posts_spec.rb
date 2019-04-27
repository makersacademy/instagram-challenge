RSpec.feature 'Timeline', type: :feature do
  include Warden::Test::Helpers


  let(:user) {user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password") }

  scenario 'Can submit posts and view them' do 
    login_as(user, :scope => :user)
    visit '/posts'


end 