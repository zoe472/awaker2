class RenameItemIdColumnToToukouimages < ActiveRecord::Migration[5.2]
  def change
    rename_column :toukouimages, :item_id, :tweet_id
  end
end
