require 'rails_helper'

feature 'adding a picture' do

  before do
    user = User.create(username: 'bob', email: 'bob@gmail.com', password: '12345678', password_confirmation: '12345678')
    login_as user
  end

  scenario 'logged in user can upload a picture file and then see it' do
    
  end

end
