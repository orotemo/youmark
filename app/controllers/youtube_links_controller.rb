class YoutubeLinksController < ApplicationController
  include UsersHelper
  respond_to :html, :json
  before_filter :log_in_user

  def create
    @youtube_link = current_user.youtube_links.build(params[:youtube_link])
    if @youtube_link.save
      redirect_to current_user, success: "Added link"
    else
      render 'users/show', error: 'failed adding link'
    end
  end

  def destroy
    @youtube_link = current_user.youtube_links.find(params[:id])
    @youtube_link.destroy
    redirect_to current_user
  end

  def mass_remove
    @youtube_links = current_user.youtube_links.find(params[:ids])
    for link in @youtube_links
      link.destroy
    end

    respond_with(current_user) do |format| 
      format.html
      format.json { render json: :ok }
    end
  end
end
