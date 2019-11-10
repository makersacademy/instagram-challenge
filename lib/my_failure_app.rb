class MyFailureApp < Devise::FailureApp
  def route(_scope)
    :index
  end
end
