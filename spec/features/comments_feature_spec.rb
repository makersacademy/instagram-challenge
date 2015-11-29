require 'rails_helper'

feature 'Comments' do
  context 'Adding a comment' do
    scenario 'can add a comment' do
      visit '/'
      expect(page).not_to have_content("Add comment")
      sign_up('adowellphoto@gmail.com', 'password')
      upload_image('a tester', true)
      add_comment('This is great')
      expect(page).to have_content("adowellphoto@gmail.com: This is great")
    end

    scenario 'can add multiple comments' do
      visit '/'
      sign_up('adowellphoto@gmail.com', 'password')
      upload_image('a tester', true)
      add_comment('This is the first')
      sign_out
      sign_up('testing@gmail.com', 'password')
      add_comment('This is the second')
      expect(page).to have_content("testing@gmail.com: This is the second")
      expect(page).to have_content("adowellphoto@gmail.com: This is the first")
    end
  end
end