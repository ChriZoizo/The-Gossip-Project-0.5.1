class GossipsController < ApplicationController
  def show
    id = params[:id]
    @gossipfind = Gossip.find(params[:id])
    @user = User.find(params[:id])
  end

  def index
    @gossips = Gossip.all
  end



  def new
    @gossip = Gossip.new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

  def create
    
    @gossip = Gossip.create('title' => params[:title],
                            'content' => params[:content],
                            'create_date' => '2017-09-23',
                            'user_id' => 01)
    if @gossip.save
    redirect_to gossip_path(@gossip.id)
    flash[:notice_good] = "Gossip Crée"
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
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end
end
