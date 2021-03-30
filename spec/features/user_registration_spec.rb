feature 'user registration spec' do
  scenario 'registering and seeing welcome on posts page' do
    visit('/')
    expect(current_path).to eq('/users/sign_in')
    sign_up

    expect(page).to have_content('Welcome')
    expect(current_path).to eq('/')
  end
end
