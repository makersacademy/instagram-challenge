require 'rails_helper.rb'
feature 'Testing infrastructure' do
  scenario 'user can visit homepage' do
    visit '/'
    expect(page).to have_content('Welcome to cloneInsta')
  end
end
