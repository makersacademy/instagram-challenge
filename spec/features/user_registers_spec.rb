require 'rails_helper'

feature 'user registers' do
  before do
    visit "/"
    click_link "Sign up"
  end

  scenario 'with valid details' do
    expect(current_path).to eq(new_user_registration_path)
    expect { sign_up }.to change{ User.count }.by(1)
    expect(current_path).to eq("/users/1")
    expect(page).to have_content("Welcome Mimi")
  end

  scenario 'with wrong email' do
    expect { sign_up(email: "Mimi") }.to_not change{ User.count }
    expect(current_path).to eq(user_registration_path)
    expect(page).to have_content("Email is invalid")
  end

  scenario 'with shorter password' do
    expect { sign_up(password: "12345", password_confirmation: "12345") }.to_not change{ User.count }
    expect(current_path).to eq(user_registration_path)
    expect(page).to have_content("Password is too short (minimum is 6 characters)")
  end

  scenario 'with wrong password confirmation' do
    expect { sign_up(password: "1234567", password_confirmation: "1234568") }.to_not change{ User.count }
    expect(current_path).to eq(user_registration_path)
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

end
