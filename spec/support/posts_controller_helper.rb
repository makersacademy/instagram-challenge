# frozen_string_literal: true

def create_post
  post :create, params: { post: { caption: 'Test post', image: image } }
end

def delete_post
  delete :destroy, params: { id: post_in_db.id }
end

def update_post
  patch :update, params: { id: post_in_db.id, post: { caption: 'updated post', image: image } }
end
