class SessionsController < ApplicationController
  include UsersHelper
  respond_to :html
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      login user
      redirect_to user
    else
      flash.now[:error] = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
