module CommentHelpers
  def add_new_comment(opinion)
    visit '/posts'
    click_link 'Comment'
    fill_in 'Opinions', with: opinion
    click_button 'Leave Comment'
  end
end
