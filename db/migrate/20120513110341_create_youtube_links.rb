class CreateYoutubeLinks < ActiveRecord::Migration
  def change
    create_table :youtube_links do |t|
      t.integer :user_id
      t.string :url

      t.timestamps
    end

    add_index :youtube_links, :user_id
  end
end
