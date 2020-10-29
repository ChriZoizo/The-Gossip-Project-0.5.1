class SessionsController < ApplicationController
def new

end


def create
    user = User.find_by(email: params[:email])

    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to landing_path(user.first_name)
      # redirige où tu veux, avec un flash ou pas
      id = session[:user_id]
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
end


def destroy
    session.delete(:user_id)
    redirect_to root_path
end

end
