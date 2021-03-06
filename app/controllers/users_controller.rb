class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all
    Artist.initilize_db
  end
  
  
  # GET /users/nbashaw
  # GET /users/nbashaw.json
  def show
    @user = User.find_by_nickname(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
    
  end
end