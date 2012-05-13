class UsersController < ApplicationController
  include UsersHelper
  before_filter :log_in_user, except: [:new, :create]

  def show 
    @youtube_link = current_user.youtube_links.build
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      login @user

      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end

  end
end
