feature 'comments' do
  context 'adding comments' do
    scenario 'fill in form' do
      add_comment_to_pic
      expect(page).to have_content 'nice'
    end
  end

  context 'delete comments' do
    scenario 'user can delete their comments' do
      add_comment_to_pic
      click_link 'Delete'
      expect(page).not_to have_content 'nice'
    end
  end

  def add_comment_to_pic
    image = create :post
    user = build :user
    sign_in(user)
    visit posts_path
    find("a.image#{image.id}").click
    fill_in 'comment[thoughts]', with: 'nice'
    click_button 'Send'
  end
end
