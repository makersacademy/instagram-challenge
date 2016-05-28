module WithUserAssociationExtension

	def create_with_user(params={},user)
  	params[:user] ||= user
  	create(params)
  end

end