module Response
  def json_response(posts)
    render json: posts.to_json(:include => [:user => [:only => :username]])
  end
end

# ender :json => @moulding.to_json(:include => [:material_costs])}
#
# render json: posts.map { |post|
#   post.as_json.merge({ image: url_for(post.image) })
# }, status: status
