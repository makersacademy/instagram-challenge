feature 'add new gram' do

  before do
    user = User.create email: 'example@example.com', password: "password", password_confirmation: "password"
    login_as user
  end

  it 'can add a gram when logged in' do
    visit '/'
    click_link "New Gram"
    page.attach_file "gram_image", 'spec/fixtures/files/test_pic.jpg' 
    expect{click_button "GRAM IT"}.to change{Gram.count}.by 1
    expect(page).to have_content "YOU GRAMMED"

  end

  it 'cannot add a gram when logged in' do
    visit '/'
    click_link "Sign Out"
    click_link "New Gram"
    page.attach_file "gram_image", 'spec/fixtures/files/test_pic.jpg' 
    click_button "GRAM IT"
    expect(page).to have_content "You must be signed in"
  end

end