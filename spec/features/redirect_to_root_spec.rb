RSpec.describe 'an unidentified user', type: :feaature do
  scenario 'they attempt to visit the main feed' do
    visit '/posts'

    expect(page).to have_current_path '/'
    expect(page).to have_content 'Pinstagram'
  end

  scenario 'they attempt to create a new post' do
    visit '/posts/new'

    expect(page).to have_current_path '/'
    expect(page).to have_content 'Pinstagram'
  end

  scenario 'they attempt to sign up' do
    visit '/users/new'

    expect(page).to have_current_path '/users/new'
  end

  scenario 'they attempt to log in' do
    visit '/sessions/new'

    expect(page).to have_current_path '/sessions/new'
  end

  scenario 'they attempt to view a profile page' do
    sign_up_sam
    sam = User.find_by({ email: 'sam@example.com' })
    click_on 'Log out'

    visit "/users/#{sam.id}"

    expect(page).to have_current_path '/'
    expect(page).to have_content 'Pinstagram'
  end
end
