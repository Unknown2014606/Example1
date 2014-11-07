class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string "topic", :limit => 20
      t.integer "parent"
    end
  end
  def down
    drop_table :topics
  end

end
