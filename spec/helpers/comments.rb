module CommentHelpers

  def comment_on_image options = {}
    click_link 'Comment'
    fill_in("Comment", with: options.fetch(:comment, "so so"))
    click_button 'Comment'
  end
end
