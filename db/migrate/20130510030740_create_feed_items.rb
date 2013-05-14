class CreateFeedItems < ActiveRecord::Migration
  def change
    create_table :feed_items do |t|
      t.integer :user_id
      t.hstore :data
      t.integer :feed_item_points_count

      t.timestamps
    end
  end
end
