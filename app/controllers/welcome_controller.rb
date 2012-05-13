class WelcomeController < ApplicationController
  include UsersHelper
  def index
    redirect_to current_user if logged_in?
  end
end
