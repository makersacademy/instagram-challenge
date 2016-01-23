feature 'Leaving comments' do

  scenario 'allows a user to leave a comment using a form' do
    post_a_picture
    leave_a_comment
    expect(current_path).to eq '/pictures'
    expect(page).to have_content 'What a fantastic cat'
  end

  scenario 'comments are deleted if it\'s picture is deleted' do
    post_a_picture
    leave_a_comment
    visit '/pictures'

    expect{ click_link 'Delete picture' }.to change{ Comment.count }.by(-1)
  end

end
