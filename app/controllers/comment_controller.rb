class CommentController < ApplicationController
  before_action :is_user?, only: [:edit, :udpate]

    def show
        id = params[:id]
        @commentfind = Comment.find(params[:id])
        @user = @commentfind.user
        @city = @user.city
        @comment_edit = Comment.find(params[:id])
        @comments = Comment.all
    
      end
      
      def index
        @comments = Comment.all
      end
    
    
    
      def new
        @comment = Comment.new
        # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
      end
    
      def create
      
        @comment = Comment.new('content': params[:content],
                                  'gossip_id': params[:gossip_id],
                                  'user_id': session[:user_id])
        if @comment.save
            redirect_back(fallback_location: root_path)    # IMPORTANT ! Permet de revenir a la page de base
        flash[:notice_good] = "comment Crée"
          else 
            flash[:notice_bad] = "Creation avortée"
            render 'new'
           
          end 
         
        # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
        # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
        # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
      end 
    
    
      def edit
        # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    
      @comment_edit = Comment.find(params[:id])
      end
    
      def update
        # @gossipid = Gossip.find(@comment[:gossip_id])
        # id = @gossipid.id
        @comment = Comment.find(params[:id])        # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
        post_params = params.require(:comment).permit(:content) 
        @comment.update(post_params) 
    
        
        if @comment.update(post_params)
            redirect_to gossip_path(@comment[:gossip_id])
          flash[:notice_good] = "Edition reussis !"
        else 
            redirect_to gossip_path(id)
          flash[:notice_bad] = "Probleme rencontré"
          
         
        end 
       
      end
    
      def destroy
    
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to root_path
        # Méthode qui récupère le potin concerné et le détruit en base
        # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
      end
end
