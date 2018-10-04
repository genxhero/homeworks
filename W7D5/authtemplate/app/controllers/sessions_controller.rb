class SessionsController < ApplicationController
  def new
    @user =User.new
    render :new
  end

def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      login(@user)
      #render json home?
    else
      flash.now[:errors] = ["Invalid Credentials"]
      render :new
    end
end

  def destroy
    logout
    #render new?
  end
end
