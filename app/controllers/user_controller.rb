class UserController < ApplicationController
  def show
    @id = params[:id]
    @userfind = User.find(params[:id])

   @gossips = Gossip.where(user:  @userfind)
  end

  def new
@user = User.new
  end

  def create
   
    @user = User.create('first_name' => params[:first_name],
                            'last_name' => params[:last_name],
                            'description' => params[:description],
                            'age' => params[:age],
                            'email' => params[:email],
                            'password' => params[:password],
                            'city_id' => 1 )
    if @user.save
log_in(@user)
    redirect_to landing_path(@user.first_name)
    flash[:notice_good] = "Compte utilisateur enregistrée"
      else 
        flash[:notice_bad] = "Creation avortée"
        render 'new'
       
      end 
  end
end
