class AddurlToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :url, :string
  end
end
