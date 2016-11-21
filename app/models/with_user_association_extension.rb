module WithUserAssociationExtension
  def new_with_user(parameters, user)
    parameters[:user] = user
    new(parameters)
  end
end