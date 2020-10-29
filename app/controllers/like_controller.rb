class LikeController < ApplicationController
before_action :find_gossip
before_action :find_like, only: [:destroy]

    def new

    end

    def create
        if already_liked?
            flash[:notice] = "You can't like more than once"
  else
        @gossip = Gossip.find(params[:gossip_id])
     @gossip.like.create(user_id: current_user.id)
     redirect_to root_path
    end
end

def destroy
    @gossip = Gossip.find(params[:gossip_id])
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to root_path
  end

    private

    def find_gossip
    @gossip = Gossip.find(params[:gossip_id])
    end

    def find_like
        @like = @gossip.like.find(params[:id])
     end

    def already_liked?
        Like.where(user_id: current_user.id, gossip_id:
        params[:gossip_id]).exists?
      end

end
