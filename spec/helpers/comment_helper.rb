module CommentHelper

  def comment
    fill_in "comment_text",	with: 'This is a comment on an image'
    click_button 'Create Comment'
  end

end
