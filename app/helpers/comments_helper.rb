module CommentsHelper
  def comment_params
    params.require(:comment).permit(:content)
  end

  def generate_json(comments)
    json = []
    comments.each do |comment|
      json << { username: comment.username, content: comment.content }
    end
    json
  end
end
