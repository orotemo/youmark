class AddVideoIdToYoutubeLinks < ActiveRecord::Migration
  def change
    add_column :youtube_links, :video_id, :string
  end
end
