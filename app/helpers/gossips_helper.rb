module GossipsHelper
    def user_is?
        @gossip = Gossip.find(params[:id])
     current_user.id == @gossip.user_id
     
      end
      
end
