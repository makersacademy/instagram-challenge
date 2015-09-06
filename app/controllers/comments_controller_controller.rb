class CommentsControllerController < ApplicationController
  def create
    console_print { p params }
  end

  def console_print
    p '-----------------------------------------------------'
    yield
    p '-----------------------------------------------------'
  end
end
