class CreateVideos < ActiveRecord::Migration
  def up
    create_table :videos do |t|
      t.string "title", :limit => 250
      t.string "url", :limit => 250
      t.string "image", :limit => 250
      t.text "excerpt"
      t.integer "topic"
      t.text "before_content"
      t.text "after_content"
    end
  end

  def down
    drop_table :videos
  end
end
