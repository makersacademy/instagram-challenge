module CommentHelpers

  def comment_on_image
    click_link 'Comment'
    fill_in "Comment", with: "so so"
    click_button 'Comment'
  end
end
