class YoutubeLinksController < ApplicationController
  include UsersHelper
  before_filter :log_in_user
  def create
    @youtube_link = current_user.youtube_links.build(params[:youtube_link])
    if @youtube_link.save
      redirect_to current_user, success: "Added link"
    else
      render 'users/show', error: 'failed adding link'
    end
  end
end
