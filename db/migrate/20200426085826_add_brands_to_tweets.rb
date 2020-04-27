class AddBrandsToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :brand_id, :integer, foreign_key: true
  end
end
