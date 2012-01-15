class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"] 
    user = User.find_by_email(auth["info"]["email"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to '/users/' + user.nickname
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
  
end
