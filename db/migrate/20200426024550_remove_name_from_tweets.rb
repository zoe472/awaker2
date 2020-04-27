class RemoveNameFromTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :category_id, :integer, foreign_key: true
  end
end
