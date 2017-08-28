module CommentHelpers
  def make_a_comment(comment: 'Adorable!')
    fill_in 'comment_body', with: comment
    click_button '⏎'
  end
end
