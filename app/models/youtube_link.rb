class YoutubeLink < ActiveRecord::Base
  attr_accessible :url
  belongs_to :user
  before_save :extract_video_id
  VIDEO_ID_REGEXP = /.+?.*v=(.+)&/

  private
  def extract_video_id
   match_data = VIDEO_ID_REGEXP.match url
   self.video_id = match_data[1] if match_data
  end
end
