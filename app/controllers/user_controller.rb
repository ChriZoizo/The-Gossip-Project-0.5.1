class UserController < ApplicationController
  def show
    @id = params[:id]
    @userfind = User.find(params[:id])

   @gossips = Gossip.where(user:  @userfind)
  end
end
