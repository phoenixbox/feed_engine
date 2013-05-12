class IndexFeedItemsData < ActiveRecord::Migration
  def up
    execute "CREATE INDEX feed_items_data ON feed_items USING GIN(data)"
  end
  
  def down
    execute "DROP INDEX feed_items_data"
  end
end
