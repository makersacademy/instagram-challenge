def create_comment
  post :create, params: { post_id: dummy_post.id, comment: { body: comment.body  } }
end

def delete_comment
  delete :destroy, params: { post_id: comment_in_db.post.id, id: comment_in_db.id }
end
