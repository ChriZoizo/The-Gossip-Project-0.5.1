class UserController < ApplicationController
  def show
    @id = params[:id]
    @userfind = User.find(params[:id])
  end
end
