
feature 'Posts' do
  scenario 'can create a post and displays the name of the user' do
    sign_up("reena@test.com", "password", "password")
    create_post("spec/images/bird.jpeg","bird")
    expect(page).to have_content('bird')
    expect(page).to have_css("img[src*='bird.jpeg']")
  end

  scenario 'Stores post in database' do
    sign_up("reena@test.com", "password", "password")
    expect{create_post("spec/images/bird.jpeg","bird")}.to change{Post.count}
 end

  scenario 'displays all the post' do
    sign_up("reena@test.com", "password", "password")
    create_post("spec/images/bird.jpeg","I love birds")
    create_post("spec/images/animal.jpg","Animal")
    visit '/posts'
    expect(page).to have_content('reena@test.com')
    expect(page).to have_content("I love birds")
    expect(page).to have_content("Animal")
    expect(page).to have_css("img[src*='bird.jpeg']")
    expect(page).to have_css("img[src*='animal.jpg']")
  end

  scenario 'can delete post' do
    sign_up("reen@test.com", "password", "password")
    create_post("spec/images/bird.jpeg","bird")
    visit '/posts'
    page.all(:link,'Destroy')[0].click
    expect(page).not_to have_content('bird')
    expect(page).not_to have_css("img[src*='bird.jpeg']")
  end

  scenario 'can update post' do
    sign_up("reen@test.com", "password", "password")
    create_post("spec/images/bird.jpeg","bird")
    visit '/posts'
    page.all(:link,'Edit')[0].click
    expect(page).to have_content('Editing Post')
    expect(page).to have_content('bird')
    expect(page).not_to have_css("img[src*='bird.jpeg']")
    attach_file('Image', "spec/images/animal.jpg")
    fill_in 'Description', with: "Animal"
    click_button 'Update Post'
    expect(page).to have_content("Animal")
    expect(page).to have_css("img[src*='animal.jpg']")
  end

  scenario 'displays the selected post' do
    sign_up("reena@test.com", "password", "password")
    create_post("spec/images/bird.jpeg","bird")
    visit '/posts'
    page.all(:link,'Show')[0].click
    expect(page).to have_content('bird')
    expect(page).to have_css("img[src*='bird.jpeg']")
  end
end
